#!/usr/bin/env bash

usage(){
cat <<EOS
Usage:
  PRE: cd $HOME/script-search
  CMD: bash $0
EOS

exit 0

}

cd $HOME/script-search

if [ $? -ne 0 ];then

  usage

fi

#プレースホルダをアットマークに変更
sed -i 's/%s/@/' M01-url-list.txt

#ディレクトリの作成
cat M01-url-list.txt | grep -Po '(?<=//).*?(?=/)' | sort | uniq | ruby -F"\." -anle 'puts "mkdir -p "+`pwd`.chomp+"/"+$F.reverse.join("_");' | bash

#クエリ式パタンリストの作成
cat M01-url-list.txt | grep -P '\?' | grep -Po '(?<=//).*?(?=/)'|sort|uniq|ruby -F"\." -anle 'puts $F.reverse.join("_")' >L01-parameter-pattern-is-query-string-list.txt

#パス式パタンリストの作成
cat M01-url-list.txt | grep -vP '\?' | grep -Po '(?<=//).*?(?=/)'|sort|uniq|ruby -F"\." -anle 'puts $F.reverse.join("_")' >L02-parameter-pattern-is-path-expresseion-list.txt

#クエリ文字列URLの抽出の正規化
cat M01-url-list.txt | grep -P '\?' >M02-url-query-string-list.txt

#クエリパス式の抽出
#TODO
cat M01-url-list.txt | grep -vP '\?' >M03-url-path-expression-list.txt

#クエリ文字列URLの正規化
cat M02-url-query-string-list.txt | grep -P '\?' | ruby -F"\?" -anle '$F[1].split(/\&/).map{|x|p $_.gsub(/.*\/\//,"").gsub(/\/.*/,"").split(/\./).reverse.join("_"),$F[0],x}'|xargs -n3>M04-url-query-string-norm-list.txt

#クエリパス式の正規化
#TODO
cat M03-url-path-expression-list.txt | grep -vP '\?' >M05-url-path-expression-norm-list.txt

#未使用ディレクトリの削除(正規化URLに登録されていないかつディレクトリ名に一つもアンダースコアが含まれていない場合)
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*/;;' | while read dir;do grep -q -P $dir M04-url-query-string-norm-list.txt; [[ 1 -eq $? ]] && echo $dir|grep -v '_'; done | xargs rm -rf

#配備 Usageファイルは除く
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | xargs -I@ echo cp T0[1-5]* @/|bash

#Usageファイルの作成
while read dir;do

  if [[ -f $dir/T06-usage-pattern-list.txt ]];then
    #あれば作成しない
    :
  else
    #なければ作成する
    cp T06-usage-pattern-list.txt $dir/T06-usage-pattern-list.txt
  fi

done < <(find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git')

#実行コマンドのリネーム
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*/;;' | xargs -I@ bash -c 'echo mv $HOME/script-search/@/T01-search-template $HOME/script-search/@/search-$(tr "_" "-"<<<@);'|bash


#検索エンジンURLの登録
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M04-url-query-string-norm-list.txt | awk -v tgt=T05-search-engine-pattern-list.txt -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{print "echo \x27"$2"\x27 > "home"/"root"/"dir"/"tgt}'; done|sort |uniq|bash


#テンプレート検索エンジンの置換
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | while read dir;do cat $dir/T05* | xargs -I@ sed -i 's+TOBE_REPLACE_SEARCH_ENGINE_PAGE+@+' $dir/search-*;done


#クエリパラメータの登録
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M04-url-query-string-norm-list.txt | awk -v tgt=T04-parameter-pattern-list.txt -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{print "echo \x27&"$3"\x27 >> "home"/"root"/"dir"/"tgt}'; done|sort |uniq|bash

#オプション引数の登録

find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat $HOME/script-search/$dir/T04-parameter-pattern-list.txt| tr -d '&' | tr '[=_:]' '-' | sed 's/^/--/' >>$HOME/script-search/$dir/T03-option-arguments-pattern-list.txt;done

#検索キー名の登録
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M04-url-query-string-norm-list.txt | grep =@ | awk -v tgt=T02-placeholder-pattern-list.txt -v key=SEARCH_CONDITION_KEY -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{gsub("=.*","",$3);print "echo \x27"key"="$3"\x27 >> "home"/"root"/"dir"/"tgt}'; done|sort |uniq|bash


#自作コマンドに登録
find $HOME/script-search -type f | grep -vP '\.git|P00-' | xargs file | grep executable| cut -d':' -f1 | sort -r | while read f;do echo ln -fsr $f $HOME/.local/script-search/bin/${f##*/};done|bash

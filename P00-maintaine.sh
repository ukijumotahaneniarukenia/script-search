#!/usr/bin/evn bash

cd $HOME/script-search

if [ $? -ne 0 ];then

  exit 1

fi

#配備
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | xargs -I@ echo cp T0* @/|bash

#実行コマンドのリネーム
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*/;;' | xargs -I@ bash -c 'echo mv $HOME/script-search/@/T01-search-template $HOME/script-search/@/search-$(tr "_" "-"<<<@);'|bash


#クエリの正規化
cat M01-url-list.txt | ruby -F"\?" -anle '$F[1].split(/\&/).map{|x|p $_.gsub(/.*\/\//,"").gsub(/\/.*/,"").split(/\./).reverse.join("_"),$F[0],x}'|xargs -n3>M02-url-norm-list.txt


#検索エンジンURLの登録
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M02-url-norm-list.txt | awk -v tgt=T05-search-engine-pattern-list.txt -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{print "echo \x27"$2"\x27 > "home"/"root"/"dir"/"tgt}'; done|sort |uniq|bash


#テンプレート検索エンジンの置換
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | while read dir;do cat $dir/T05* | xargs -I@ sed -i 's+TOBE_REPLACE_SEARCH_ENGINE_PAGE+@+' $dir/search-*;done


#クエリパラメータの登録

find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M02-url-norm-list.txt | awk -v tgt=T04-parameter-pattern-list.txt -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{print "echo \x27&"$3"\x27 >> "home"/"root"/"dir"/"tgt}'; done|sort |uniq|bash

#オプション引数の登録

find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat $HOME/script-search/$dir/T04-parameter-pattern-list.txt| tr -d '&' | tr '[=_:]' '-' | sed 's/^/--/' >>$HOME/script-search/$dir/T03-option-arguments-pattern-list.txt;done

#検索キー名の登録
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M02-url-norm-list.txt | grep =@ | awk -v tgt=T02-placeholder-pattern-list.txt -v key=SEARCH_CONDITION_KEY -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{gsub("=.*","",$3);print "echo \x27"key"="$3"\x27 >> "home"/"root"/"dir"/"tgt}'; done|sort |uniq|bash

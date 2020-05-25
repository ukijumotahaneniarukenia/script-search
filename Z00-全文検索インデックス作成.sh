#!/usr/bin/env bash

usage(){
  cat <<EOS
Usage:
  $0 script-env
EOS
exit 0
}

ENV_REPO=$1

[ -z $ENV_REPO ] && usage

TANGO_LIST_FILE=tango-list-file.txt


HEADER="ファイル名\t行番号\t開始列番号\t文書"

cat $TANGO_LIST_FILE | xargs -I@ ack --nocolor --nogroup --column @ -r $HOME/$ENV_REPO | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})*)?m//g" | \
#https://blog.monophile.net/posts/20150207_delete_ansi_color.html
while read s;do
  echo $s | awk -v FS=':' -v OFS='\t' '{print $1,$2,$3,$4}'
done | sed "1i$HEADER"

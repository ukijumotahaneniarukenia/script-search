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

grep -I -l -r $HOME/$ENV_REPO | xargs -P0 cat | sed 's/\W/\n/g' | sed '/^$/d' | sed 's/^\s+//;s/\s+$//;' | awk '{ a[$0]=$0 }END{for(e in a){print a[e]}}' | sort >tango-list-file.txt

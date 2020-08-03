ディレクトリなど作ってぶちこみ

```
$ grep SEARCH_ENGINE -r $HOME/script-search | grep http | grep -vP md-cmd.md | ruby -F":" -anle '$a=$F[2].gsub(/\/\//,"").gsub(/\/.*/,"").split(".");p $F[0],$a.reverse.join("_")' | xargs -n2 | awk -v DIR=$(pwd) -v PREFIX=search '{print "mkdir -p "DIR"/"$2;}'

$ find -type d | grep -vP '^\.$|\.git' | xargs -I@ echo cp T0* @/
```

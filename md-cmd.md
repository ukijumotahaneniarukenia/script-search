- IN

```
$ cat M01-url-list.txt
http://golang.org/search?q=@
http://jp.uptodown.com/android/search?@
http://jp.uptodown.com/mac/search?@
http://jp.uptodown.com/windows/search?q=@&ref=opensearch+l%3A%28OR+Text+OR+Markdown+OR+Shell%29&s=stars&o=desc
http://oeis.org/search?q=@&sort=rel
http://www.mit.edu/search/?q=@
http://www.pinterest.com/search/pins/?q=@&rs=direct_navigation
https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=libvirt&?q=@
https://bitbucket.org/repo/all?name=@
https://blog.medium.com/search?q=@&ref=opensearch
https://cocoapods.org/?q=@
https://community.rstudio.com/search?q=@
https://developer.android.com/s/results?q=@
https://docs.docker.jp/search.html?q=@&check_keywords=yes&area=default
https://gist.github.com/search?q=@#gsc.tab=0&gsc.q=java&gsc.page=1
https://gist.github.com/search?q=@&ref=opensearch&s=stars&o=desc
https://gist.github.com/search?q=@&ref=opensearch&s=stars&o=desc&l=Dockerfile
https://github.com/search?q=@&ref=opensearch
https://godoc.org/?q=@
https://ja.wikipedia.org/w/index.php?search=@&fulltext=1
https://medium.engineering/search?q=@&ref=opensearch
https://netflixtechblog.com/search?q=@&ref=opensearch
https://pypi.org/search/?q=@&o=-zscore
https://qiita.com/search?q=@
https://towardsdatascience.com/search?q=@&ref=opensearch
https://translate.google.com/?source=osdd#auto|auto|@
https://www.die.net/search/?q=@
https://www.youtube.com/results?search_query=@&page={startPage?}&utm_source=opensearch
https://www.youtube.com/results?search_query=@&page={startPage?}&utm_source=opensearch
https://yandex.com/search/??text=@
```


- CMD

  - ディレクトリ作成
```
$ cat M01-url-list.txt | grep -Po '(?<=//).*?(?=/)' | sort | uniq | ruby -F"\." -anle 'puts "mkdir -p"+`pwd`.chomp+"/"+$F.reverse.join("_");'
```

- OUT

```
mkdir -p/home/aine/script-search/com_vagrantup_app
mkdir -p/home/aine/script-search/org_bitbucket
mkdir -p/home/aine/script-search/com_medium_blog
mkdir -p/home/aine/script-search/org_cocoapods
mkdir -p/home/aine/script-search/com_rstudio_community
mkdir -p/home/aine/script-search/com_android_developer
mkdir -p/home/aine/script-search/jp_docker_docs
mkdir -p/home/aine/script-search/com_github_gist
mkdir -p/home/aine/script-search/com_github
mkdir -p/home/aine/script-search/org_godoc
mkdir -p/home/aine/script-search/org_golang
mkdir -p/home/aine/script-search/org_wikipedia_ja
mkdir -p/home/aine/script-search/com_uptodown_jp
mkdir -p/home/aine/script-search/engineering_medium
mkdir -p/home/aine/script-search/com_netflixtechblog
mkdir -p/home/aine/script-search/org_oeis
mkdir -p/home/aine/script-search/org_pypi
mkdir -p/home/aine/script-search/com_qiita
mkdir -p/home/aine/script-search/com_towardsdatascience
mkdir -p/home/aine/script-search/com_google_translate
mkdir -p/home/aine/script-search/net_die_www
mkdir -p/home/aine/script-search/edu_mit_www
mkdir -p/home/aine/script-search/com_pinterest_www
mkdir -p/home/aine/script-search/com_youtube_www
mkdir -p/home/aine/script-search/com_yandex
```

- CMD

```
$ paste  <(cat M01-url-list.txt | grep -Po '(?<=//).*?(?=/)'|ruby -F'\.' -anle 'puts $F.reverse.join("_")') M01-url-list.txt
```

- OUT

```
org_golang	http://golang.org/search?q=@
com_uptodown_jp	http://jp.uptodown.com/android/search?@
com_uptodown_jp	http://jp.uptodown.com/mac/search?@
com_uptodown_jp	http://jp.uptodown.com/windows/search?q=@&ref=opensearch+l%3A%28OR+Text+OR+Markdown+OR+Shell%29&s=stars&o=desc
org_oeis	http://oeis.org/search?q=@&sort=rel
edu_mit_www	http://www.mit.edu/search/?q=@
com_pinterest_www	http://www.pinterest.com/search/pins/?q=@&rs=direct_navigation
com_vagrantup_app	https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=libvirt&?q=@
org_bitbucket	https://bitbucket.org/repo/all?name=@
com_medium_blog	https://blog.medium.com/search?q=@&ref=opensearch
org_cocoapods	https://cocoapods.org/?q=@
com_rstudio_community	https://community.rstudio.com/search?q=@
com_android_developer	https://developer.android.com/s/results?q=@
jp_docker_docs	https://docs.docker.jp/search.html?q=@&check_keywords=yes&area=default
com_github_gist	https://gist.github.com/search?q=@#gsc.tab=0&gsc.q=java&gsc.page=1
com_github_gist	https://gist.github.com/search?q=@&ref=opensearch&s=stars&o=desc
com_github_gist	https://gist.github.com/search?q=@&ref=opensearch&s=stars&o=desc&l=Dockerfile
com_github	https://github.com/search?q=@&ref=opensearch
org_godoc	https://godoc.org/?q=@
org_wikipedia_ja	https://ja.wikipedia.org/w/index.php?search=@&fulltext=1
engineering_medium	https://medium.engineering/search?q=@&ref=opensearch
com_netflixtechblog	https://netflixtechblog.com/search?q=@&ref=opensearch
org_pypi	https://pypi.org/search/?q=@&o=-zscore
com_qiita	https://qiita.com/search?q=@
com_towardsdatascience	https://towardsdatascience.com/search?q=@&ref=opensearch
com_google_translate	https://translate.google.com/?source=osdd#auto|auto|@
net_die_www	https://www.die.net/search/?q=@
com_youtube_www	https://www.youtube.com/results?search_query=@&page={startPage?}&utm_source=opensearch
com_youtube_www	https://www.youtube.com/results?search_query=@&page={startPage?}&utm_source=opensearch
com_yandex	https://yandex.com/search/??text=@
```


配備

- IN

```
$ find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | xargs -I@ echo cp T0* @/
```

- OUT

```
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_github/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_pypi/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_android_developer/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/engineering_medium/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_youtube_www/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_pinterest_www/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_oeis/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_golang/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/jp_docker_docs/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/jp_co_google_www/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/to_dev/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/edu_mit_www/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_qiita/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_uptodown_jp/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_godoc/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_towardsdatascience/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/net_die_www/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_netflixtechblog/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_google_translate/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_github_gist/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_cocoapods/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_wikipedia_ja/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_yandex/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_rstudio_community/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_scala-lang_index/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/org_bitbucket/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_vagrantup_app/
cp T01-search-template T02-placeholder-pattern-list.txt T03-option-arguments-pattern-list.txt T04-parameter-pattern-list.txt /home/aine/script-search/com_medium_blog/
```


リネーム

- IN

```
$ find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*/;;' | xargs -I@ bash -c 'echo mv $HOME/script-search/@/T01-search-template $HOME/script-search/@/search-$(tr "_" "-"<<<@);'
```


- OUT

```
mv /home/aine/script-search/com_github/T01-search-template /home/aine/script-search/com_github/search-com-github
mv /home/aine/script-search/org_pypi/T01-search-template /home/aine/script-search/org_pypi/search-org-pypi
mv /home/aine/script-search/com_android_developer/T01-search-template /home/aine/script-search/com_android_developer/search-com-android-developer
mv /home/aine/script-search/engineering_medium/T01-search-template /home/aine/script-search/engineering_medium/search-engineering-medium
mv /home/aine/script-search/com_youtube_www/T01-search-template /home/aine/script-search/com_youtube_www/search-com-youtube-www
mv /home/aine/script-search/com_pinterest_www/T01-search-template /home/aine/script-search/com_pinterest_www/search-com-pinterest-www
mv /home/aine/script-search/org_oeis/T01-search-template /home/aine/script-search/org_oeis/search-org-oeis
mv /home/aine/script-search/org_golang/T01-search-template /home/aine/script-search/org_golang/search-org-golang
mv /home/aine/script-search/jp_docker_docs/T01-search-template /home/aine/script-search/jp_docker_docs/search-jp-docker-docs
mv /home/aine/script-search/jp_co_google_www/T01-search-template /home/aine/script-search/jp_co_google_www/search-jp-co-google-www
mv /home/aine/script-search/to_dev/T01-search-template /home/aine/script-search/to_dev/search-to-dev
mv /home/aine/script-search/edu_mit_www/T01-search-template /home/aine/script-search/edu_mit_www/search-edu-mit-www
mv /home/aine/script-search/com_qiita/T01-search-template /home/aine/script-search/com_qiita/search-com-qiita
mv /home/aine/script-search/com_uptodown_jp/T01-search-template /home/aine/script-search/com_uptodown_jp/search-com-uptodown-jp
mv /home/aine/script-search/org_godoc/T01-search-template /home/aine/script-search/org_godoc/search-org-godoc
mv /home/aine/script-search/com_towardsdatascience/T01-search-template /home/aine/script-search/com_towardsdatascience/search-com-towardsdatascience
mv /home/aine/script-search/net_die_www/T01-search-template /home/aine/script-search/net_die_www/search-net-die-www
mv /home/aine/script-search/com_netflixtechblog/T01-search-template /home/aine/script-search/com_netflixtechblog/search-com-netflixtechblog
mv /home/aine/script-search/com_google_translate/T01-search-template /home/aine/script-search/com_google_translate/search-com-google-translate
mv /home/aine/script-search/com_github_gist/T01-search-template /home/aine/script-search/com_github_gist/search-com-github-gist
mv /home/aine/script-search/org_cocoapods/T01-search-template /home/aine/script-search/org_cocoapods/search-org-cocoapods
mv /home/aine/script-search/org_wikipedia_ja/T01-search-template /home/aine/script-search/org_wikipedia_ja/search-org-wikipedia-ja
mv /home/aine/script-search/com_yandex/T01-search-template /home/aine/script-search/com_yandex/search-com-yandex
mv /home/aine/script-search/com_rstudio_community/T01-search-template /home/aine/script-search/com_rstudio_community/search-com-rstudio-community
mv /home/aine/script-search/org_scala-lang_index/T01-search-template /home/aine/script-search/org_scala-lang_index/search-org-scala-lang-index
mv /home/aine/script-search/org_bitbucket/T01-search-template /home/aine/script-search/org_bitbucket/search-org-bitbucket
mv /home/aine/script-search/com_vagrantup_app/T01-search-template /home/aine/script-search/com_vagrantup_app/search-com-vagrantup-app
mv /home/aine/script-search/com_medium_blog/T01-search-template /home/aine/script-search/com_medium_blog/search-com-medium-blog
```



クエリの正規化

- IN

```
$ cat M01-url-list.txt | ruby -F"\?" -anle '$F[1].split(/\&/).map{|x|p $_.gsub(/.*\/\//,"").gsub(/\/.*/,"").split(/\./).reverse.join("_"),$F[0],x}'|xargs -n3>M02-url-norm-list.txt
```

- OUT

```
org_golang http://golang.org/search q=@
org_oeis http://oeis.org/search q=@
org_oeis http://oeis.org/search sort=rel
edu_mit_www http://www.mit.edu/search/ q=@
com_pinterest_www http://www.pinterest.com/search/pins/ q=@
com_pinterest_www http://www.pinterest.com/search/pins/ rs=direct_navigation
com_vagrantup_app https://app.vagrantup.com/boxes/search utf8=%E2%9C%93
com_vagrantup_app https://app.vagrantup.com/boxes/search sort=downloads
com_vagrantup_app https://app.vagrantup.com/boxes/search provider=libvirt
org_bitbucket https://bitbucket.org/repo/all name=@
com_medium_blog https://blog.medium.com/search q=@
com_medium_blog https://blog.medium.com/search ref=opensearch
org_cocoapods https://cocoapods.org/ q=@
com_rstudio_community https://community.rstudio.com/search q=@
com_android_developer https://developer.android.com/s/results q=@
jp_docker_docs https://docs.docker.jp/search.html q=@
jp_docker_docs https://docs.docker.jp/search.html check_keywords=yes
jp_docker_docs https://docs.docker.jp/search.html area=default
com_github_gist https://gist.github.com/search q=@
com_github_gist https://gist.github.com/search ref=opensearch
com_github_gist https://gist.github.com/search s=stars
com_github_gist https://gist.github.com/search o=desc
com_github https://github.com/search q=@
com_github https://github.com/search ref=opensearch
org_godoc https://godoc.org/ q=@
org_wikipedia_ja https://ja.wikipedia.org/w/index.php search=@
org_wikipedia_ja https://ja.wikipedia.org/w/index.php fulltext=1
engineering_medium https://medium.engineering/search q=@
engineering_medium https://medium.engineering/search ref=opensearch
com_netflixtechblog https://netflixtechblog.com/search q=@
com_netflixtechblog https://netflixtechblog.com/search ref=opensearch
org_pypi https://pypi.org/search/ q=@
org_pypi https://pypi.org/search/ o=-zscore
com_qiita https://qiita.com/search q=@
com_towardsdatascience https://towardsdatascience.com/search q=@
com_towardsdatascience https://towardsdatascience.com/search ref=opensearch
com_google_translate https://translate.google.com/ source=osdd#auto|auto|@
net_die_www https://www.die.net/search/ q=@
com_youtube_www https://www.youtube.com/results search_query=@
com_youtube_www https://www.youtube.com/results page={startPage
com_yandex https://yandex.com/search/ text=@
```


検索エンジンURLの登録

- IN

```
$ find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M02-url-norm-list.txt | awk -v tgt=T05-search-engine-pattern-list.txt -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{print "echo \x27"$2"\x27 > "home"/"root"/"dir"/"tgt}'; done|sort |uniq
```

- OUT

```
echo 'http://golang.org/search' > /home/aine/script-search/org_golang/T05-search-engine-pattern-list.txt
echo 'http://oeis.org/search' > /home/aine/script-search/org_oeis/T05-search-engine-pattern-list.txt
echo 'http://www.mit.edu/search/' > /home/aine/script-search/edu_mit_www/T05-search-engine-pattern-list.txt
echo 'http://www.pinterest.com/search/pins/' > /home/aine/script-search/com_pinterest_www/T05-search-engine-pattern-list.txt
echo 'https://app.vagrantup.com/boxes/search' > /home/aine/script-search/com_vagrantup_app/T05-search-engine-pattern-list.txt
echo 'https://bitbucket.org/repo/all' > /home/aine/script-search/org_bitbucket/T05-search-engine-pattern-list.txt
echo 'https://blog.medium.com/search' > /home/aine/script-search/com_medium_blog/T05-search-engine-pattern-list.txt
echo 'https://cocoapods.org/' > /home/aine/script-search/org_cocoapods/T05-search-engine-pattern-list.txt
echo 'https://community.rstudio.com/search' > /home/aine/script-search/com_rstudio_community/T05-search-engine-pattern-list.txt
echo 'https://developer.android.com/s/results' > /home/aine/script-search/com_android_developer/T05-search-engine-pattern-list.txt
echo 'https://docs.docker.jp/search.html' > /home/aine/script-search/jp_docker_docs/T05-search-engine-pattern-list.txt
echo 'https://gist.github.com/search' > /home/aine/script-search/com_github_gist/T05-search-engine-pattern-list.txt
echo 'https://github.com/search' > /home/aine/script-search/com_github/T05-search-engine-pattern-list.txt
echo 'https://godoc.org/' > /home/aine/script-search/org_godoc/T05-search-engine-pattern-list.txt
echo 'https://ja.wikipedia.org/w/index.php' > /home/aine/script-search/org_wikipedia_ja/T05-search-engine-pattern-list.txt
echo 'https://medium.engineering/search' > /home/aine/script-search/engineering_medium/T05-search-engine-pattern-list.txt
echo 'https://netflixtechblog.com/search' > /home/aine/script-search/com_netflixtechblog/T05-search-engine-pattern-list.txt
echo 'https://pypi.org/search/' > /home/aine/script-search/org_pypi/T05-search-engine-pattern-list.txt
echo 'https://qiita.com/search' > /home/aine/script-search/com_qiita/T05-search-engine-pattern-list.txt
echo 'https://towardsdatascience.com/search' > /home/aine/script-search/com_towardsdatascience/T05-search-engine-pattern-list.txt
echo 'https://translate.google.com/' > /home/aine/script-search/com_google_translate/T05-search-engine-pattern-list.txt
echo 'https://www.die.net/search/' > /home/aine/script-search/net_die_www/T05-search-engine-pattern-list.txt
echo 'https://www.youtube.com/results' > /home/aine/script-search/com_youtube_www/T05-search-engine-pattern-list.txt
echo 'https://yandex.com/search/' > /home/aine/script-search/com_yandex/T05-search-engine-pattern-list.txt
```


テンプレート検索エンジンの置換

- IN

```
find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | while read dir;do cat $dir/T05* | xargs -I@ sed -i 's+TOBE_REPLACE_SEARCH_ENGINE_PAGE+@+' $dir/search-*;done
```

- OUT

```

```


クエリパラメータの登録

- IN

```
$ find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M02-url-norm-list.txt | awk -v tgt=T04-parameter-pattern-list.txt -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{print "echo \x27&"$3"\x27 >> "home"/"root"/"dir"/"tgt}'; done|sort |uniq
```

- OUT

```
e=$HOME -v root=script-search 'dir==$1{print "echo \x27&"$3"\x27 >> "home"/"root"/"dir"/"tgt}'; done|sort |uniq
echo '&area=default' >> /home/aine/script-search/jp_docker_docs/T04-parameter-pattern-list.txt
echo '&check_keywords=yes' >> /home/aine/script-search/jp_docker_docs/T04-parameter-pattern-list.txt
echo '&fulltext=1' >> /home/aine/script-search/org_wikipedia_ja/T04-parameter-pattern-list.txt
echo '&name=@' >> /home/aine/script-search/org_bitbucket/T04-parameter-pattern-list.txt
echo '&o=-zscore' >> /home/aine/script-search/org_pypi/T04-parameter-pattern-list.txt
echo '&o=desc' >> /home/aine/script-search/com_github_gist/T04-parameter-pattern-list.txt
echo '&provider=libvirt' >> /home/aine/script-search/com_vagrantup_app/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_android_developer/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_github/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_github_gist/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_medium_blog/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_netflixtechblog/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_pinterest_www/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_qiita/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_rstudio_community/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/com_towardsdatascience/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/edu_mit_www/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/engineering_medium/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/jp_docker_docs/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/net_die_www/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/org_cocoapods/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/org_godoc/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/org_golang/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/org_oeis/T04-parameter-pattern-list.txt
echo '&q=@' >> /home/aine/script-search/org_pypi/T04-parameter-pattern-list.txt
echo '&ref=opensearch' >> /home/aine/script-search/com_github/T04-parameter-pattern-list.txt
echo '&ref=opensearch' >> /home/aine/script-search/com_github_gist/T04-parameter-pattern-list.txt
echo '&ref=opensearch' >> /home/aine/script-search/com_medium_blog/T04-parameter-pattern-list.txt
echo '&ref=opensearch' >> /home/aine/script-search/com_netflixtechblog/T04-parameter-pattern-list.txt
echo '&ref=opensearch' >> /home/aine/script-search/com_towardsdatascience/T04-parameter-pattern-list.txt
echo '&ref=opensearch' >> /home/aine/script-search/engineering_medium/T04-parameter-pattern-list.txt
echo '&rs=direct_navigation' >> /home/aine/script-search/com_pinterest_www/T04-parameter-pattern-list.txt
echo '&s=stars' >> /home/aine/script-search/com_github_gist/T04-parameter-pattern-list.txt
echo '&search=@' >> /home/aine/script-search/org_wikipedia_ja/T04-parameter-pattern-list.txt
echo '&search_query=@' >> /home/aine/script-search/com_youtube_www/T04-parameter-pattern-list.txt
echo '&sort=downloads' >> /home/aine/script-search/com_vagrantup_app/T04-parameter-pattern-list.txt
echo '&sort=rel' >> /home/aine/script-search/org_oeis/T04-parameter-pattern-list.txt
echo '&source=osdd#auto|auto|@' >> /home/aine/script-search/com_google_translate/T04-parameter-pattern-list.txt
echo '&text=@' >> /home/aine/script-search/com_yandex/T04-parameter-pattern-list.txt
echo '&utf8=%E2%9C%93' >> /home/aine/script-search/com_vagrantup_app/T04-parameter-pattern-list.txt
```


オプション引数の登録

- IN

```
$ find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat $HOME/script-search/$dir/T04-parameter-pattern-list.txt| tr -d '&' | tr '[=_:]' '-' | sed 's/^/--/' >>$HOME/script-search/$dir/T03-option-arguments-pattern-list.txt;done
```

- OUT

```

```


検索キー名の登録

- IN

```
$ find $HOME/script-search -mindepth 1 -type d | grep -vP '\.git' | sed 's;.*\/;;'| while read dir;do cat M02-url-norm-list.txt | grep =@ | awk -v tgt=T02-placeholder-pattern-list.txt -v key=SEARCH_CONDITION_KEY -v dir=$dir -v home=$HOME -v root=script-search 'dir==$1{gsub("=.*","",$3);print "echo \x27"key"="$3"\x27 >> "home"/"root"/"dir"/"tgt}'; done|sort |uniq
```

- OUT

```
echo 'SEARCH_CONDITION_KEY=name' >> /home/aine/script-search/org_bitbucket/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_android_developer/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_github/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_github_gist/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_medium_blog/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_netflixtechblog/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_pinterest_www/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_qiita/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_rstudio_community/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/com_towardsdatascience/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/edu_mit_www/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/engineering_medium/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/jp_docker_docs/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/net_die_www/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/org_cocoapods/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/org_godoc/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/org_golang/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/org_oeis/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=q' >> /home/aine/script-search/org_pypi/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=search' >> /home/aine/script-search/org_wikipedia_ja/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=search_query' >> /home/aine/script-search/com_youtube_www/T02-placeholder-pattern-list.txt
echo 'SEARCH_CONDITION_KEY=text' >> /home/aine/script-search/com_yandex/T02-placeholder-pattern-list.txt
```

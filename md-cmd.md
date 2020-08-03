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

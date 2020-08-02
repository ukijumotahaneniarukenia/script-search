- クエリ文字列パタンの抽出

IN

```
$ grep DEF -r . | grep echo | grep -P '\?\$' | cut -d: -f1 | xargs -n1 | sed -r "s;\.;\$HOME/script-search;"
```

OUT

```
$HOME/script-search/google_translate/search-google_translate
$HOME/script-search/yandex/search-yandex
$HOME/script-search/pinterest/search-pinterest
$HOME/script-search/android_developer/search-android_developer
$HOME/script-search/youtube_music/search-youtube_music
$HOME/script-search/golang/search-golang
$HOME/script-search/godoc/search-godoc
$HOME/script-search/netflixtechblog/search-netflixtechblog
$HOME/script-search/Vagrant/search-Vagrant
$HOME/script-search/youtube/search-youtube
$HOME/script-search/cocoapods/search-cocoapods
$HOME/script-search/wikipedia_ja/search-wikipedia_ja
$HOME/script-search/github/search-github
$HOME/script-search/die_net/search-die_net
$HOME/script-search/pypi/search-pypi
$HOME/script-search/bitbucket/search-bitbucket
$HOME/script-search/google/search-google
$HOME/script-search/medium_engineering/search-medium_engineering
$HOME/script-search/docker/search-docker
$HOME/script-search/towardsdatascience/search-towardsdatascience
$HOME/script-search/medium_blog/search-medium_blog
$HOME/script-search/scala_lang/search-scala_lang
$HOME/script-search/qiita/search-qiita
$HOME/script-search/oeis/search-oeis
$HOME/script-search/rstudio_community/search-rstudio_community
$HOME/script-search/mit/search-mit
$HOME/script-search/gist/search-gist
$HOME/script-search/gist/search-gist-Dockerfile
$HOME/script-search/gist/search-gist-systemd_nspawn
$HOME/script-search/dev_to/search-dev_to
```

IN

```
$ grep DEF -r . | grep echo | grep -P '\?\$' | cut -d: -f1 | xargs -n1 | sed -r "s;\.;\$HOME/script-search;" | grep -vP 'md-cmd.md' | wc -l
```

OUT

```
30
```


- URLパタンの抽出

IN

```
$ grep DEF -r . | grep echo | grep -vP '\?\$' | cut -d: -f1 | xargs -n1 | sed -r "s;\.;\$HOME/script-search;" | grep -vP 'md-cmd.md'
```

OUT

```
$HOME/script-search/uptodown_ja_android/search-uptodown_ja_android
$HOME/script-search/uptodown_ja_mac/search-uptodown_ja_mac
$HOME/script-search/uptodown_ja_windows/search-uptodown_ja_windows
```

IN

```
$ grep DEF -r . | grep echo | grep -vP '\?\$' | cut -d: -f1 | xargs -n1 | sed -r "s;\.;\$HOME/script-search;" | grep -vP 'md-cmd.md' | wc -l
```

OUT

```
3
```


- クエリ文字列のパタン抽出

IN

```
$ cat parameter-pattern-list.txt | grep -Po '&[-a-zA-Z0-9@:%._\+~#=/]+' | sort | uniq
```

OUT

```
&filters=MY_POSTS
&filters=class_name:Article
&filters=class_name:Comment
&filters=class_name:PodcastEpisode
&filters=class_name:User
&sort_by=published_at
&sort_direction=asc
&sort_direction=desc
```


- オプション引数の作成

IN

```
$ cat P01-parameter-pattern-list.txt | tr -d '&' | tr '[=_:]' '-' | sed 's/^/--/'
```

OUT

```
--filters-MY-POSTS
--filters-class-name-Article
--filters-class-name-Comment
--filters-class-name-PodcastEpisode
--filters-class-name-User
--sort-by-published-at
--sort-direction-asc
--sort-direction-desc
```

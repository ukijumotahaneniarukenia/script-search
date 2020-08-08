できた

なんだかjavaのパッケージ名みたいになってしまった

M01にどんどんついかするイメージ

クエリのビルドパタンをシステム共通とサイト個別パタンで管理

google翻訳めんどい


サイト内検索の短縮URLの逆引き-->APIあるからそれで






ディレクトリ作成

```
$ mkdir -p /home/aine/.local/script-search/bin
```

パス通す

```
$ find $HOME/script-search -type f | grep -vP '\.git|P00-' | xargs file | grep executable| cut -d':' -f1 | sort -r | while read f;do echo ln -fsr $f $HOME/.local/script-search/bin/${f##*/};done
```



```
人気デートスポット AND (福岡 OR 長崎)
```

```
site:https://www.seleniumqref.com/ AND (ボタン AND (押下 OR クリック)
```


```
(走れメロス OR ドグラマグラ) AND site:www.aozora.gr.jp
```


```
link:https://www.xml.com/
```

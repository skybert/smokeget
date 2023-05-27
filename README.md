# SmokeGET - SVG graph of server response times

- zero conf


```text
$ smokeget --clear https://skybert.net
SmokeGET graph of https://skybert.net: /tmp/smoke.svg
.................................................................
```

## Options


## Installation

`smokeget` needs `curl`:
```text
# pacman -S curl
```

If `.`s and `E`s are enough for you, you don't need to install
anything more, but in case you want SVG graphs, you must have
[gnuplot](http://www.gnuplot.info/) installed:

```text
# pacman -S gnuplot
```


## Example use

```text
$ smokeget --clear https://edition.cnn.com
SmokeGET graph of https://edition.cnn.com: /tmp/smoke.svg
.................................................................
```

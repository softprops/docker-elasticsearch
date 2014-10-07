# docker elasticsearch

## usage

build.

```bash
$ docker build -t `whoami`/elasticsearch .
```

run.

```bash
$ docker run -t -i --rm -p 9200:9200 `whoami`/elasticsearch
```

work it.

```bash
$ curl -i "http://$(boot2docker ip 2>/dev/null):9200"
```


Doug Tangren (softprops) 2014

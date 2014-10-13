# docker elasticsearch

## usage

### build

```bash
$ docker build -t `whoami`/elasticsearch .
```

### run

ports

port | use
-----|--------------
9200 | rest api port
9300 | native port

volumes

path  | use
------|-------------------
/data | persistent storage

```bash
$ docker run -t -i --rm -p 9200:9200 `whoami`/elasticsearch
```

### work it

```bash
$ curl -i "http://$(boot2docker ip 2>/dev/null):9200"
```


Doug Tangren (softprops) 2014

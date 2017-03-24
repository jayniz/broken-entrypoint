# Entrypoint doesn't see arguments

## Build

```shell
$ git clone git@github.com:jayniz/broken-entrypoint.git
...
$ docker build -t broken-entrypoint .
```

## Expected

```
$ docker run broken-entrypoint foobar
I was called with: foobar
```

## Actual

```
$ docker run broken-entrypoint foobar
I was called with:
```

## However

```shell
$ docker run --entrypoint /bin/entrypoint.sh broken-entrypoint foobar
I was called with: foobar
```

# 🤔

## Reason

This is because the entrypoint is specified in *shell* form:

```
ENTRYPOINT /bin/entrypoint.sh
```

If you change it to the (preferred) *exec* form:

```
ENTRYPOINT ["/bin/entrypoint.sh"]
```

passing command line arguments will work. It's worth reading the
[ENTRYPOINT section](https://docs.docker.com/engine/reference/builder/#entrypoint)
of the docs 🌈

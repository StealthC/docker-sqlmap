# docker-sqlmap

Sqlmap container with all optionals dependencies.

## Pulling the image

```
docker pull stealthc/sqlmap
```

## Typical usage

```
docker run --rm -it -v "$(pwd)/:/work/" stealthc/sqlmap -u http://vuln.site.com/i?=1 -p i
```

Where `/work/` is the container's default directory of the output logs, databases and dumps.

In this example, the current directory `{?PWD}` is mounted at the desired place.

## Authors

* **Carlos Alberto Castelo Elias Filho** - [StealthC](https://github.com/StealthC)

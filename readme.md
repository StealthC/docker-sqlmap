# docker-sqlmap

Sqlmap Docker container with maximum optionals dependencies.

## Pulling the image

```
docker pull stealthc/sqlmap
or docker pull stealthc/sqlmap:alpine
```

Note: the alpine version don't have the following dependencies:
- python-kinterbasdb
- websocket-client
- ibm-db


Current sqlmap version:
- alpine: 1.3

## Typical usage

```
docker run --rm -it -v "$(pwd)/:/work/" stealthc/sqlmap -u http://vuln.site.com/i?=1 -p i
```

Where `/work/` is the container's default directory of the output logs, databases and dumps.

In this example, the current directory `{?PWD}` is mounted at the desired place.

## Authors

* **Carlos Alberto Castelo Elias Filho** - [StealthC](https://github.com/StealthC)

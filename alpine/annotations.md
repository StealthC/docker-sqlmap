https://github.com/sqlmapproject/sqlmap/archive/1.3.tar.gz





install (apk)
fica:
  curl
build:
  build-base
  freetds-dev
  postgresql-dev
  unixodbc-dev
  libffi-dev


pip install
  cython
  pymssql
  pymysql
  cx_oracle
  psycopg2
  jaydebeapi
  JPype1
  pyodbc
  impacket
  python-ntlm

python-kinterbasdb
websocket-client
ibm-db





Copiando arquivos
mkdir /usr/src/sqlmap
curl -o sqlmap.tar.gz -fSL "https://github.com/sqlmapproject/sqlmap/archive/${SQLMAP_VERSION}.tar.gz"
tar -xvf sqlmap.tar.gz --strip 1 -C /usr/src/sqlmap
rm sqlmap.tar.gz


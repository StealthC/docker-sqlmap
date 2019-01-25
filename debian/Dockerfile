FROM python:2

RUN buildDeps=' \
        unixodbc-dev \
	' \
&& apt-get update && apt-get install -y --no-install-recommends\
    $buildDeps \
&& pip install \
    pymssql \
    pymysql \
    psycopg2 \
    psycopg2-binary \
    ibm-db \
    cx_oracle \
    jaydebeapi \
    python-ntlm \
    impacket \
    websocket-client \
    sqlalchemy \
    mysql-python \
&& apt-get purge -y --auto-remove $buildDeps \
&& apt-get install -y --no-install-recommends\
    unixodbc \
&& rm -rf /tmp/* \
&& rm -rf /var/tmp/* \
&& rm -rf /var/lib/apt/lists/* \
&& mkdir /work


ENV SQLMAP_VERSION=1.3
RUN mkdir /usr/src/sqlmap \
    && curl -o sqlmap.tar.gz -fSL "https://github.com/sqlmapproject/sqlmap/archive/${SQLMAP_VERSION}.tar.gz" \
    && tar -xvf sqlmap.tar.gz --strip 1 -C /usr/src/sqlmap \
    && rm sqlmap.tar.gz

WORKDIR /work

VOLUME /work

ENTRYPOINT ["python2", "/usr/src/sqlmap/sqlmap.py", "--output-dir=/work"]

CMD ["-hh"]


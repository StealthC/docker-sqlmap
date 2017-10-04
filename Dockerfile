FROM python:2.7

LABEL Name="sqlmap with optional dependencies" Author="Carlos Alberto Castelo Elias Filho <cacefmail@gmail.com>"

RUN buildDeps=' \
        freetds-dev \
        unixodbc-dev \
        unixodbc \
        ' \
&& apt-get update && apt-get install -y --no-install-recommends\
    python-psycopg2 \
    python-impacket \
    python-kinterbasdb \
    python-ntlm \
    $buildDeps \
&& pip install --no-cache-dir \
    pymysql \
    cx_Oracle \
    ibm_db\
    jaydebeapi \
    websocket-client \
    pyodbc \
    git+https://github.com/pymssql/pymssql.git \
&& apt-get purge -y --auto-remove $buildDeps \
&& rm -rf /tmp/* \
&& rm -rf /var/tmp/* \
&& rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
RUN mkdir /work

VOLUME /work
ENV PYTHONPATH=/usr/lib/python2.7/dist-packages:$PYTHONPATH
ENTRYPOINT ["python", "/opt/sqlmap/sqlmap.py", "--output-dir=/work"]

CMD ["-hh"]
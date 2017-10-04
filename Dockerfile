
FROM python:2.7

LABEL Name="sqlmap with optional dependencies" Author="Carlos Alberto Castelo Elias Filho <cacefmail@gmail.com>"

RUN apt-get update && apt-get install -y --no-install-recommends\
    unixodbc \
    unixodbc-dev \
    freetds-dev \
    python-psycopg2 \
    python-impacket \
    python-kinterbasdb \
    python-ntlm \
&& pip install --no-cache-dir \
    pymysql \
    cx_Oracle \
    ibm_db\
    jaydebeapi \
    websocket-client \
    pyodbc \
    git+https://github.com/pymssql/pymssql.git \
&& rm -rf /var/lib/apt/lists/* \
&& apt-get purge -y \
    unixodbc \
    unixodbc-dev \
    freetds-dev \
&& rm -rf /tmp/* 

RUN git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git /opt/sqlmap
RUN mkdir /work

VOLUME /work
ENV PYTHONPATH=/usr/lib/python2.7/dist-packages:$PYTHONPATH
ENTRYPOINT ["python", "/opt/sqlmap/sqlmap.py", "--output-dir=/work"]

CMD ["-hh"]


FROM python:2-alpine

RUN set -ex; \
	\
	apk add --no-cache --virtual .build-deps \
	    build-base \
	    freetds-dev \
	    postgresql-dev \
	    unixodbc-dev \
	    libffi-dev \
	; \
    apk add --no-cache \
	    freetds \
	    postgresql \
	    unixodbc \
	    libffi \
	; \
    pip2 install cython; \
    pip2 install \
        pymssql \
        pymysql \
        cx_oracle \
        psycopg2 \
        jaydebeapi \
        JPype1 \
        pyodbc \
        impacket \
        python-ntlm \
        websocket-client; \
    apk add --no-cache curl; \
	apk del .build-deps; \
    mkdir /work

WORKDIR /work
VOLUME /work

ENV SQLMAP_VERSION=1.3
RUN set -ex; \
    mkdir /usr/src/sqlmap; \
    curl -o sqlmap.tar.gz -fSL "https://github.com/sqlmapproject/sqlmap/archive/${SQLMAP_VERSION}.tar.gz"; \
    tar -xvf sqlmap.tar.gz --strip 1 -C /usr/src/sqlmap; \
    rm sqlmap.tar.gz

ENTRYPOINT ["python2", "/usr/src/sqlmap/sqlmap.py", "--output-dir=/work"]

CMD ["-hh"]


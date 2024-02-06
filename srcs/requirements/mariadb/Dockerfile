FROM debian:bookworm

RUN apt-get update -y \
&& apt-get update -y \
&& apt-get install mariadb-server -y \
&& apt-get install vim -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/script.sh /etc/mysql/mariadb.conf.d

RUN chmod 775 /etc/mysql/mariadb.conf.d/script.sh
ENTRYPOINT ["/etc/mysql/mariadb.conf.d/script.sh"]

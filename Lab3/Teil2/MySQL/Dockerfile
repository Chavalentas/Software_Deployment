FROM debian:jessie

ENV DB_ROOT_PW=root
ENV DB_NAME=lab3
ENV DB_USER=stefan
ENV DB_PASSWORD=test

RUN apt update 
RUN apt install -y wget
RUN apt install -y lsb-release
RUN wget http://repo.mysql.com/mysql-apt-config_0.8.9-1_all.deb
RUN dpkg -i mysql-apt-config_0.8.9-1_all.deb
RUN echo "mysql-server mysql-server/root_password password $DB_ROOT_PW" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password $DB_ROOT_PW" | debconf-set-selections
RUN apt install -y mysql-server
RUN service mysql restart
RUN sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
VOLUME [ "/var/lib/mysql" ]
EXPOSE 3306

CMD service mysql restart && \
    mysql --user=root --password=$DB_ROOT_PW -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';" || true && \
    mysql --user=root --password=$DB_ROOT_PW -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;" && \
    mysql --user=root --password=$DB_ROOT_PW -e "CREATE TABLE IF NOT EXISTS $DB_NAME.users(id INT NOT NULL AUTO_INCREMENT, username VARCHAR(100) NOT NULL, PRIMARY KEY (id));" && \
    mysql --user=root --password=$DB_ROOT_PW -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO $DB_USER;" && \
    mysqld
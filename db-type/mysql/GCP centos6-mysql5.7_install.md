# MySQL 5.7.x을 설치하기 위한 yum 저장소 설치
$ rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el5-8.noarch.rpm

# MySQL 5.7.x을 설치
$ yum install mysql-server

# 에러 발생 클리어
yum remove mysql-libs
yum clean dbcache

yum install mysql-server

[xbb321@instance-1 ~]$ mysql -u root
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/lib/mysql/mysql.sock' (2)


cd /var/run
cp -rp ./mysqld ./mysqld.bak
service mysqld stop
mv ./mysqld.bak/ ./mysqld
mysqld_safe --skip-grant-tables --skip-networking &
mysql -u root
```
UPDATE mysql.user SET authentication_string=PASSWORD('bitek01!') WHERE user='root';
FLUSH PRIVILEGES;
quit
```

mysql -u root -pbitek01!

mysql> use mysql;
ERROR 1820 (HY000): You must reset your password using ALTER USER statement before executing this statement.

SET PASSWORD = PASSWORD('bitek01!');
use mysql;

INSERT INTO mysql.user (host,user,authentication_string,ssl_cipher, x509_issuer, x509_subject) VALUES ('%','root',password('bitek01!'),'','','');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

service mysqld restart

root

# yum -y install http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
# yum -y install mysql-community-server
# systemctl start mysqld
# systemctl enable mysqld
# mysql

cat /var/log/mysqld.log |grep password;
mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED BY '5ki6Za*bzCy0';
FLUSH PRIVILEGES;
SHOW variables LIKE 'validate_password%';
SET GLOBAL validate_password_policy=LOW;

uninstall plugin validate_password;
FLUSH PRIVILEGES;

mysql_secure_installation



firewall-cmd --zone=public --add-port=3306/tcp --permanent
firewall-cmd --reload

mysql> use mysql         >> mysql 디비 선택
mysql> GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '패스워드' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'oracle' WITH GRANT OPTION;
mysql> GRANT TRIGGER ON *.* TO 'root'@'%' WITH GRANT OPTION;
mysql> GRANT SUPER ON *.* TO 'root'@'%';
mysql> FLUSH PRIVILEGES;

sudo vi /etc/my.cnf

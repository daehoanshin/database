# MySQL 5.7.x을 설치하기 위한 yum 저장소 설치
$ rpm -ivh https://dev.mysql.com/get/mysql57-community-release-el5-8.noarch.rpm

# MySQL 5.7.x을 설치
$ yum install mysql-server

# CentOS 6가 제공하는 최신 버전인 5.5.x에서 업그레이드할 경우
$ service mysqld stop
$ yum update mysql-server

# 설치 중 [Errno 256] No more mirrors to try. 오류가 발생할 경우 아래와 같이 실행 후 재설치
$ rm -rf /var/cache/yum/*
$ yum clean all

# 업그레이드했을 경우 구버전 테이블 구조를 신버전으로 변경하기 위해 실행, 반드시 재시작 필요
$ mysql_upgrade -u root -p
$ service mysqld restart

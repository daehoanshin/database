1. Download RPM by yum

yum install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm



2. Yum update (주의 : 전체 업데이트 됨)

yum -y update



3. Install postgresql96
yum -y install postgresql96 postgresql96-server postgresql96-contrib postgresql96-libs



4. Init DB

/usr/pgsql-9.6/bin/postgresql96-setup initdb



5. Register on service

systemctl start postgresql-9.6



6. Test

ps -ef | grep postgres

su – postgres
psql



*. 설치 확인 (Check yum Installation)

[root@localhost usr]# yum list | grep postgres
postgresql96.x86_64                     9.6.0-1PGDG.rhel7              @pgdg96
postgresql96-contrib.x86_64             9.6.0-1PGDG.rhel7              @pgdg96
postgresql96-libs.x86_64                9.6.0-1PGDG.rhel7              @pgdg96
postgresql96-server.x86_64              9.6.0-1PGDG.rhel7              @pgdg96



-----

위에 까지만 하면 로컬에서 psql 은 동작하나, 디폴트는 외부에서 DB로 접속이 안되는 상태일 것이다. 외부 접속을 허용하려면 다음과 같이 한다.



2-1. Edit pg_hba.conf

vi /var/lib/pgsql/9.6/data/pg_hba.conf



위 파일을 열어 맨 아래줄에 다음 내용을 추가한 후 저장
host    all     all     0.0.0.0/0       password



2-2. Edit postgresql.conf

vi /var/lib/pgsql/9.6/data/postgresql.conf



위 파일을 열어 접근 주소를 '*' 로 바꿔준 후 저장

listen_address = '*'

2-3. Restart service
systemctl restart postgresql-9.6



-----

[참고 사이트]

https://www.liquidweb.com/kb/how-to-install-and-connect-to-postgresql-on-centos-7/



공감과 감사 댓글은 블로그를 운영하는데 힘이 됩니다.



출처: https://java-architect.tistory.com/1 [민봉기(Ryan)의 자바 이야기]

# 변경
```
모든 IP 허용[2]
INSERT INTO mysql.user (host,user,authentication_string,ssl_cipher, x509_issuer, x509_subject) VALUES ('%','root',password('패스워드'),'','','');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

INSERT INTO mysql.user (host,user,authentication_string,ssl_cipher, x509_issuer, x509_subject) VALUES ('%','xbb123',password('oracle'),'','','');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;

```
```
IP 대역 허용 ( 예: 111.222.xxx.xxx )
다음과 같이 설정하면 111.222로 시작하는 모든 IP가 허용된다.
INSERT INTO mysql.user (host,user,authentication_string,ssl_cipher, x509_issuer, x509_subject) VALUES ('111.222.%','root',password('패스워드'),'','','');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'111.222.%';
FLUSH PRIVILEGES;
특정 IP 1개 허용 ( 예: 111.222.33.44 )
INSERT INTO mysql.user (host,user,authentication_string,ssl_cipher, x509_issuer, x509_subject) VALUES ('111.222.33.44','root',password('패스워드'),'','','');
GRANT ALL PRIVILEGES ON *.* TO 'root'@'111.222.33.44';
FLUSH PRIVILEGES;
```

## 비트나미
* my.ini
```
  bind-address=0.0.0.1
```

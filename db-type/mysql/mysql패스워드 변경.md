# 5.6미만
```
UPDATE mysql.user SET password=PASSWORD('패스워드') WHERE user='root';
FLUSH PRIVILEGES;
quit
```

# 5.7이상
```
UPDATE mysql.user SET authentication_string=PASSWORD('bitek01!') WHERE user='root';
FLUSH PRIVILEGES;
quit

```

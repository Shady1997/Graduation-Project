cd C:\xampp\mysql\bin
mysqldump -hlocalhost -uroot -p test < "D:\backup\backup_%date:~-4,4%%date:~-10,2%%date:~0,2%%time:~3,2%%time:~6,2%.sql"
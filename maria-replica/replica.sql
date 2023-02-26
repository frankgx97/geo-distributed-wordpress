CREATE USER 'readuser'@'%' IDENTIFIED BY 'secret';
GRANT SELECT ON *.* TO 'readuser'@'%';
FLUSH PRIVILEGES;

CREATE USER 'maxscale'@'%' IDENTIFIED BY 'secret';
GRANT SELECT ON *.* TO 'maxscale'@'%';
FLUSH PRIVILEGES;

CREATE USER 'maxscaleuser'@'%' IDENTIFIED BY 'secret';
GRANT SELECT ON *.* TO 'maxscaleuser'@'%';
FLUSH PRIVILEGES;

CHANGE MASTER TO
  MASTER_HOST='primary.tail1234a.ts.net',
  MASTER_USER='repluser',
  MASTER_PASSWORD='replsecret',
  MASTER_PORT=3306,
  MASTER_CONNECT_RETRY=10,
  MASTER_USE_GTID=slave_pos;
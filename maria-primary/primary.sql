CREATE USER 'repluser'@'%' IDENTIFIED BY 'replsecret';
GRANT REPLICATION SLAVE ON *.* TO 'repluser'@'%';

CREATE USER 'maxscale'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'maxscale'@'%';
FLUSH PRIVILEGES;

CREATE USER 'maxscaleuser'@'%' IDENTIFIED BY 'secret';
GRANT ALL PRIVILEGES ON *.* TO 'maxscaleuser'@'%';
FLUSH PRIVILEGES;

CREATE DATABASE wp CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
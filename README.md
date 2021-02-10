# Docker Compose LEMP Stack

This repository contains a little `docker-compose` configuration to start a `LEMP (Linux, Nginx, MariaDB, PHP)` stack.

## Details

The following versions are used.

* PHP 7.2 (FPM)
* Nginx 1.13.6
* MariaDB 10.3.9

## Configuration

The Nginx configuration can be found in `config/nginx/`.

You can also set the following environment variables, for example in the included `.env` file:

| Key | Description |
|-----|-------------|
|APP_NAME|The name used when creating a container.|
|MYSQL_ROOT_PASSWORD|The MySQL root password used when creating the container.|

## Usage

To use it, simply follow the following steps:

##### Clone this repository.

Clone this repository with the following command: `git clone https://github.com/stevenliebregt/docker-compose-lemp-stack.git`.

##### Start the server.

Start the server using the following command inside the directory you just cloned: `docker-compose up`.

## Entering the containers

You can use the following command to enter a container:

Where `{CONTAINER_NAME}` is one of:

`docker exec -ti {CONTAINER_NAME} /bin/bash`

* `{APP_NAME}-php`
* `{APP_NAME}-nginx`
* `{APP_NAME}-mariadb`

####################### Magento Install ##########################

docker exec -it cf297998a9b6 php -d memory_limit=-1 /var/www/html/magento/bin/magento setup:install --base-url=http://m2.local-docker.com/ --db-host=mysql --db-name=magento --db-user=magento --db-password=magento --admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com --admin-user=admin --admin-password=admin123 --language=en_US --currency=USD --timezone=America/Chicago --use-rewrites=1 --search-engine=elasticsearch7 --elasticsearch-host=elasticsearch --elasticsearch-port=9200

###### DB Dump ################
mysqldump -u magento –p  magento > db/magento-sample.sql

mysqldump -u root -p magento > db/magento-sample.sql
docker exec -it --user root 66cba14d36d9 mysqldump -u root -p magento > db/magento-sample.sql


mysqldump -u root -p magento > C:\MySQLBackup\sakila_20200424.sql



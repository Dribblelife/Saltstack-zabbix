db-install:
  pkg.installed:
    - pkgs:
      - mariadb-server
      - mariadb
      - MySQL-python


  service.running:
    - name: mariadb
 
  cmd.run:
    - name: mysql -e "DELETE FROM mysql.user WHERE User='';" && mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" && mysql -e "DROP DATABASE IF EXISTS test;" && mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'" && mysql -e "FLUSH PRIVILEGES;"
    - onlyif: mysql -e "show databases;"

  mysql_user.present:
    - name: root
    - password: westos

db-configure:
  file.managed:
    - name: /mnt/create.sql.gz
    - source: salt://mariadb/files/create.sql.gz

  mysql_database.present:
    - name: zabbix
    - character_set: utf8
    - collate: utf8_bin
    - connection_user: root
    - connection_pass: westos

  mysql_user.present:
    - name: zabbix
    - host: localhost
    - password: westos
    - connection_user: root
    - connection_pass: westos

  mysql_grants.present:
    - grant: all privileges
    - database: zabbix.*
    - user: zabbix
    - connection_user: root
    - connection_pass: westos

  cmd.wait:
    - name: zcat /mnt/create.sql.gz | mysql -pwestos zabbix
    - watch:
      - mysql_database: db-configure


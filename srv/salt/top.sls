base:
  'server4':
    - mariadb.install
    - zabbix-server.install
    - zabbix-web.install

  'server5':
    - zabbix-agent.install

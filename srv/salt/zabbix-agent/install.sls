include:
  - repos.zabbix

agent-install:
  pkg.installed:
    - name: zabbix-agent

  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix-agent/files/zabbix_agentd.conf
    - template: jinja
    - context:
      zabbixserver: {{ pillar['ZABBIX-SERVER'] }}
      hostname: {{ grains['fqdn'] }}

  service.running:
    - name: zabbix-agent
    - watch:
      - file: agent-install

{% if grains['fqdn'] == 'server4' %}
DBPASSWD: westos
{% else %}
ZABBIX-SERVER: 172.25.0.4
{% endif %}

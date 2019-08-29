# Saltstack-zabbix
我这里使用salt推了以下zabbix，主要包括zabbix-server、zabbix-agent、zabbix-web以及mysql。

- 需要注意的是，我这里只用了两台虚拟机作为示例，分别是server4和server5，在目录srv/salt/top.sls可以清晰的看出其作用：

这里是srv/salt/top.sls的内容：
```yml
  'server4':
    - mariadb.install
    - zabbix-server.install
    - zabbix-web.install

  'server5':
    - zabbix-agent.install
```
所以，可以批量的添加，我们只需要修改这里的文件即可。

#  待改进

我这里只是简单的实现了推zabbix-server和部分agent，还没有实现一些更常用的功能，比如，在此基础上，加上zabbix-proxy的部署。

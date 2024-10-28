# -*- coding: utf-8 -*-
# vim: ft=sls

enable and run  firewall service:
  service.running:
    - name: firewalld
    - enable: true

firewall-default-setup:
  firewalld.present:
    - name: "public"
    - services:
       - cockpit
       - dhcpv6-client
       - ssh
       - https
  


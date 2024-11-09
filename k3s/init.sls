---
{% if  salt['pillar.get']('k3s.token') is defined %}

include:
  - .firewalld
  - .install
{% endif %}


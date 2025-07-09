{% if  salt['pillar.get']('rancher.version') is defined %}

include:
  - rancher.helm
  - rancher.cert-manager
  - rancher.rancher-install
{% else %}

{% do  salt["log.info"]("no rancher version set") -%}

{% endif %}




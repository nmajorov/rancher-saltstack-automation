{% if  salt['pillar.get']('rancher.version') is defined %}

include:
  - rancher.helm
  - rancher.cert-manager
  - rancher.rancher-helm
{% else %}

{% do  salt["log.info"]("no rancher version set") -%}

{% endif %}




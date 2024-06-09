# install rancher stable release
{% set rancher_namespace = 'cattle-system' %}


include:
  - rancher.helm


ensure_namespace_created:
  cmd.run:
    - name: "kubectl create namespace {{ rancher_namespace }}"


# install rancher stable release
{% set rancher_namespace = 'cattle-system' %}
{% set rancher_replicas = 1 %}
{% set rancher_hostname = grains['nodename'] %}
{% set rancher_version = '2.8.4' %}

include:
  - rancher.helm


ensure_namespace_created:
  cmd.run:
    - name: "kubectl create namespace {{ rancher_namespace }} ||  echo 'warning: namespace already exists' "

# By using || instead of | you won't get your script interrupted by the error

# TODO: install cert-manager first


install_rancher_stable:
  cmd.run: 
    - name: |
        helm install rancher rancher-stable/rancher \
        --namespace={{ rancher_namespace }} \
        --set hostname={{ rancher_hostname }} \
        --set replicas={{ rancher_replicas }} \
        --version={{ rancher_version }}
    - env:
      - KUBECONFIG: '/etc/rancher/k3s/k3s.yaml'


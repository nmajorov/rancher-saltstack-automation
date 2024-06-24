# install rancher stable release
{% set rancher_namespace = 'cattle-system' %}
{% set rancher_replicas = 1 %}
{% set rancher_hostname = grains['nodename'] %}
{% set rancher_version = '2.8.4' %}


include:
  - rancher.helm
  - rancher.cert-manager



ensure_namespace_created:
  cmd.run:
    - name: "kubectl create namespace {{ rancher_namespace }} ||  echo 'warning: namespace already exists' "



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

# -set bootstrapPassword=<PASSWORD_FOR_RANCHER_ADMIN>

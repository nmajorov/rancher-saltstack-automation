# install rancher stable release
{% set rancher_namespace = 'cattle-system' %}
{% set rancher_replicas = 1 %}
{% set rancher_hostname = salt['pillar.get']('rancher:host') %}
{% set rancher_version =  salt['pillar.get']('rancher:version') %}



ensure_namespace_created:
    # kubernetes.namespace_present:
    # - name: "{{ rancher_namespace }}"
    # - env:
    #   - KUBECONFIG: '/etc/rancher/k3s/k3s.yaml'
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
# 

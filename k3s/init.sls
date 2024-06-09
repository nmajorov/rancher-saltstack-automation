---
include:
  - k3s.firewalld

{% set k3s_token = salt['pillar.get']('k3s:token') %}

{% set k3s_version = salt['pillar.get']('k3s:version') %}

{% do salt.log.info("k3s_token:" ~ k3s_token) %}

k3s_setup1:
  cmd.run:
    - name: >
        curl -sfL 'https://get.k3s.io' | 
        INSTALL_K3S_VERSION="{{ k3s_version }}" 
        K3S_KUBECONFIG_MODE="644" sh -s - server --token {{ k3s_token }} 


k3s_setup2:
  cmd.run:
    - name: "while [ ! -f /tmp/K3s-Ready ]; do kubectl get nodes | grep Ready; if [ $? -eq 0 ]; then touch /tmp/K3s-Ready; fi; done"


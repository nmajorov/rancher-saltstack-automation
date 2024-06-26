
---

{% set cert_manager_version = 'v1.15.0' %}


# By using || instead of | you won't get your script interrupted by the error


create_cert_manager_namespace:
  kubernetes.namespace_present:
    - name: cert-manager
    - env:
      - KUBECONFIG: '/etc/rancher/k3s/k3s.yaml'

install_cert_crd:
  cmd.run:
    - name: |
        kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/${CERT_MANAGER_VERSION}/cert-manager.crds.yaml
    - env:
      - CERT_MANAGER_VERSION: "{{ cert_manager_version }}"


install_cert_manager_helm_chart:
  cmd.run:
    - name: |
        helm install cert-manager jetstack/cert-manager \
          --namespace cert-manager \
          --create-namespace \
          --version ${CERT_MANAGER_VERSION}
    - env:
      - CERT_MANAGER_VERSION: "{{ cert_manager_version }}"
      - KUBECONFIG: '/etc/rancher/k3s/k3s.yaml'


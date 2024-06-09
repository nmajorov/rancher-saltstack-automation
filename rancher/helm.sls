---
install_helm:
  pkg.installed:
    - pkgs:
      - helm

helm_cattle_repo_install:
  helm.repo_managed:
    - present:
      - name: rancher-stable
        url: https://releases.rancher.com/server-charts/stable


helm_cert_manager_repo_install:
  helm.repo_managed:
    - present:
      - name: jetstack
        url: https://charts.jetstack.io


helm_repository_is_updated:
  helm.repo_updated


show_rancher_chart:
  cmd.run:
    - name: "helm search repo rancher"



## Lists all versions of all charts
# helm search repo -l 
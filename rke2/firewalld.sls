---
set frirewall for rke2:
  firewalld.present:
    - name: "public"
    - services:
        - http
        - https
    - ports:
      - 6443/tcp # kubernetes api server
      - 443/tcp
      - 2376/tcp # etcd
      - 2379/tcp
      - 2380/tcp
      # - 8472/udp # flannel
      - 9345/tcp # agent
      - 10250/tcp # kubelet metrics
      - 10254/tcp
      - 30000-32767/tcp # NodePort port range
  
  firewalld:
    service.running:
      - reload: True
      - watch:
        - firewalld: public


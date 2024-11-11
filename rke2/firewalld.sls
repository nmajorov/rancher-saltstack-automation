---
ensure firewalld is running for rancher:
  cmd.run:
    - name: " systemctl start firewalld"

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
      - 10250-10254/tcp # kubelet metrics
      - 30000-32767/tcp # NodePort port range
    - name: trusted
    - sources:
      - 10.42.10.64/26 # via 10.42.10.64 dev vxlan.calico onlink 
      - 10.42.206.128/26 # calico blackhole
    

  firewalld:
    service.running:
      - reload: True
      - watch:
        - firewalld: public


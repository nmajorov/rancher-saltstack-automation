---
firewall-setup:
  firewalld.present:
    - name: "public"
    - ports:
      - 6443/tcp #apiserver
    - name: trusted
    - sources:
      - 10.42.0.0/16 #pods
      - 10.43.0.0/16 #services
  
  firewalld:
    service.running:
      - reload: True
      - watch:
        - firewalld: public


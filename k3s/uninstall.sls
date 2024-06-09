---
# remove k3s from machine
#
#
#
k3s.uninstall:
  cmd.run:
    - name: /usr/local/bin/k3s-uninstall.sh



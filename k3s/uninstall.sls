---
# remove k3s from machine
#
#
#

{% if salt['file.file_exists']('/usr/local/bin/k3s-agent-uninstall.sh') %}
run_agent_uninstall_if_exists:
  cmd.run:
    - name: /usr/local/bin/k3s-agent-uninstall.sh
{% endif %}

k3s_uninstall:
  cmd.run:
    - name: /usr/local/bin/k3s-uninstall.sh
    - onlyif: 'test -f /usr/local/bin/k3s-uninstall.sh'

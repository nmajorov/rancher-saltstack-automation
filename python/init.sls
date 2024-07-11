# install and configure python3

---

install_python3:
    pkg.installed:
        - pkgs:
            - python3

configure_python:
    cmd.run:
     {% if grains['os_family'] == 'Debian' %} 
        - name:  update-alternatives --install /usr/bin/python python  /usr/bin/python3 1
     {% else%}
        - name: alternatives --install  /usr/bin/python python /usr/bin/python3 1
     {% endif%}
install_extras_modules:
    pip.installed:
        - name: kubernetes

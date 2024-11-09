---
# default packages to install in all base environments
default-pkgs:
    pkg.installed:
        - pkgs:
            - tmux
            - firewalld
            - chrony
           {% if grains['os_family'] == 'Suse' %}
            - update-alternatives
            - vim
            - git-core
            - bash-completion
            {% if 'Tumbleweed' in   grains['oscodename'] %}
            - python311
            {% else %}     
            # for opensuse leap install just python3
            - python3
            {% endif %}     
            {% endif %}
           {% if grains['os_family'] == 'RedHat'  %}
            - bash-completion
            - alternatives
            - git-all
            - vim-common
            - python3
           {% endif %}
           {% if grains['os_family'] == 'Debian'  %}
            - git-all
            - vim
            - vim-common
            - python3
           {% endif %}


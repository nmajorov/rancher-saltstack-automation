---
# default packages to install in all base environments
default-pkgs:
    pkg.installed:
        - pkgs:
            - tmux
            - python3
            - firewalld
            - chrony
           {% if grains['os_family'] == 'Suse'  %}
            - update-alternatives
            - vim
            - git-core
            - bash-completion
           {% endif %}
           {% if grains['os_family'] == 'RedHat'  %}
            - bash-completion
            - alternatives
            - git-all
            - vim-common
           {% endif %}
           {% if grains['os_family'] == 'Debian'  %}
            - git-all
            - vim
            - vim-common
           {% endif %}


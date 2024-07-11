---
# default packages to install in all base environments
default-pkgs:
    pkg.installed:
        - pkgs:
            - tmux
            - python3
           {% if grains['os_family'] != 'Debian' %} 
            - update-alternatives
           {% endif %}
            - vim

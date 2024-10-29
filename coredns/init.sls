# -*- coding: utf-8 -*-
# vim: ft=yaml

# default packages to install in all base environments
install coredns package:
    pkg.installed:
        - pkgs:
            {% if grains['os_family'] == 'Suse' %}
            - coredns     
            {% endif %}


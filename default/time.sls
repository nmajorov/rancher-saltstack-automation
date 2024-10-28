# -*- coding: utf-8 -*-
# vim: ft=sls


{% set eu_time_zone = salt['pillar.get']('time:zone') %}


set-timezone-for-system:
  cmd.run:
    - name: >
        timedatectl set-timezone "{{ eu_time_zone }}"

chrony-package-install-pkg-installed:
  pkg.installed:
    - name: chrony

chrony-service-running-service-running:
  service.running:
    - name: chronyd
    - enable: True
    - reload: True

chrony-correct-offset:
  cmd.run:
    - name: chronyc makestep

ntp:
  pkg.installed:
    - name: ntp


ntp_running:
  service.running:
    - name: ntpd
    - enable: True
    - require:
      - pkg: ntp


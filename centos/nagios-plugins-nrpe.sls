nagios-plugins-nrpe:
  pkg.installed:
    - name: nagios-plugins-nrpe
    - require:
      - pkg: epel

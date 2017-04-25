httpd:
  pkg.installed:
    - httpd: httpd

httpd_running:
  service.running:
    - name: httpd
    - enable: True
    - require:
      - pkg: httpd
    - watch:
      - file: /etc/httpd/conf.d/welcome.conf

/etc/httpd/conf.d/welcome.conf:
  file.managed:
    - source: salt://config/welcome.conf
    - user: root
    - group: root
    - mode: 655
    - require:
      - pkg: httpd

/var/www/html/index.html:
   file.managed:
     - source: salt://config/index.html
     - template: jinja
     - user: nobody
     - group: nobody
     - mode: 655

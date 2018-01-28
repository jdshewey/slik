{%- if pillar.freeipa.server is defined %}
katello_sources:
  file.managed:
    - name: /etc/yum.repos.d/katello-install.repo
    - source:  salt://slik/files/slik-install.repo
    - template: jinja
    - require_in:
      - pkg: freeipa_server_pkgs
127.0.0.1:
  host.only:
    - hostnames:
      - localhost
      - localhost.localdomain
      - localhost6
      - localhost6.localdomain6
    - require_in:
      - pkg: freeipa_server_pkgs
ipv6_loopback:
  host.only:
    - name: ::1
    - hostnames:
      - localhost
      - localhost.localdomain
      - localhost6
      - localhost6.localdomain6
    - require_in:
      - pkg: freeipa_server_pkgs
{%- for ip in grains['ipv4'] %}
{%-   if loop.index0 < 2 %}
{%-     if '127.0.0' not in ip %}
{{ ip }}:
  host.only:
    - hostnames: 
      - {{ grains['fqdn'] }}
    - require_in:
      - pkg: freeipa_server_pkgs
{%-     endif %}
{%-   endif %}
{%- endfor %}
slik_progress_1:
  cmd.run:
    - name: echo "Beginning FreeIPA installation. This will take a few minutes." >> $(tty) 2>&1
    - require:
      - host: ipv6_loopback
    - require_in:
      - pkg: freeipa_server_pkgs
    - creates: /etc/ipa/default.conf 
include:
  - freeipa
slik_progress_2:
  cmd.run:
    - name: echo "FreeIPA installation finished. Success or failure will be reported at the end." >> $(tty) 2>&1
    - require:
      - cmd: freeipa_server_install
    - require_in:
      - cmd: slik_install_pkgs
    - creates: /etc/ipa/default.conf 
{%- endif %}

slik_install_pkgs:
  cmd.run:
    - name: yum -y install katello >> $(tty) 2>&1

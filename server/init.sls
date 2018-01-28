{%- if pillar.freeipa.server is defined %}
katello_sources:
  file.managed:
    - name: /etc/yum.repos.d/katello-install.repo
    - source:  salt://katello/files/katello-install.repo
    - template: jinja
include:
  - freeipa
{%- endif %}
#slik_install_pkgs:
#  cmd.run:
#    - name: yum -y install ipa-server >> $(tty) 2>&1

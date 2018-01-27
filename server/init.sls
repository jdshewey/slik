{%- if pillar.freeipa.server is defined %}
include:
  - freeipa.server
{%- endif %}
slik_install_pkgs
  cmd.run:
    - name: yum -y install ipa-server >> $(tty) 2>&1

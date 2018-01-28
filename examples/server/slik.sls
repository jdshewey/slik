freeipa:
  server:
    enabled: True
    realm: {{ grains['domain'].upper() }}
    domain:  {{ grains['domain'] }}
    ldap:
      password: UtjDf83OJCVn
    dns:
      enabled: True
openssh:
  server:
    enabled: False
katello:
  server:
    admin_user: admin
    admin_pass: UtjDf83OJCVn

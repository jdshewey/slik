#/bin/bash
systemctl stop salt-minion
echo "
  * The salt master and minion services and packages will be removed." 

yum -y remove 389-ds-base \
389-ds-base-libs \
antlr-tool \
args4j \
augeas-libs \
autofs \
autogen-libopts \
avalon-framework \
avalon-logkit \
bcel \
bea-stax \
bea-stax-api \
c-ares \
cal10n \
certmonger \
codemodel \
custodia \
cyrus-sasl-md5 \
dom4j \
easymock2 \
fontawesome-fonts \
glassfish-dtd-parser \
glassfish-fastinfoset \
glassfish-jaxb \
glassfish-jaxb-api \
gssproxy \
hamcrest \
hesiod \
hsqldb \
httpd \
ipa-common \
isorelax \
istack-commons \
jackson \
jakarta-commons-httpclient \
jakarta-oro \
javassist \
jaxen \
jboss-annotations-1.1-api \
jdom \
jing \
joda-convert \
joda-time \
jsr-311 \
jss \
junit \
jvnet-parent \
keyutils \
krb5-server \
krb5-workstation \
ldapjdk \
libbasicobjects \
libcollection \
libdhash \
libevent \
libini_config \
libipa_hbac \
libldb \
libnfsidmap \
libpath_utils \
libref_array \
libsmbclient \
libtalloc \
libtdb \
libtevent \
libtirpc \
libverto-tevent \
libwbclient \
msv-msv \
msv-xsdlib \
nfs-utils \
ntp \
ntpdate \
nuxwdog \
objectweb-asm \
oddjob \
open-sans-fonts \
openldap-clients \
perl-Archive-Tar \
perl-DB_File \
perl-IO-Zlib \
perl-Mozilla-LDAP \
perl-NetAddr-IP \
perl-Package-Constants \
pki-base \
pki-ca \
pki-server \
python-augeas \
python-cffi \
python-custodia \
python-dns \
python-enum34 \
python-gssapi \
python-idna \
python-ipaddress \
python-jwcrypto \
python-kdcproxy \
python-libipa_hbac \
python-netaddr \
python-netifaces \
python-nss \
python-ply \
python-pycparser \
python-qrcode-core \
python-sss-murmur \
python-sssdconfig \
python-yubico \
python2-cryptography \
python2-ipaclient \
python2-ipalib \
python2-ipaserver \
python2-pyasn1 \
python2-pyasn1-modules \
pyusb \
qdox \
quota \
regexp \
relaxngDatatype \
resteasy-base-atom-provider \
resteasy-base-client \
resteasy-base-jackson-provider \
resteasy-base-jaxb-provider \
resteasy-base-jaxrs \
resteasy-base-jaxrs-api \
rngom \
rpcbind \
samba-common \
scannotation \
slapi-nis \
slf4j \
softhsm \
sssd-common \
stax-ex \
stax2-api \
svrcore \
tcp_wrappers \
tomcat-lib \
txw2 \
velocity \
words \
ws-jaxme \
xmlrpc-c \
xmlrpc-c-client \
xpp3 \
xsom \
subscription-manager \
salt-repo-latest-2.el7.noarch 

if [ $? == 0 ]; then
        yum -y remove subscription-manager salt-repo-latest-2.el7.noarch
	rm -rf /etc/yum.reps.d/*
	cp -rp /etc/slik/rpm-sources-backup/* /etc/yum.repos.d/
	rm -rf /var/lib/pulp
	rm -rf /var/lib/mongodb
	rm -rf /etc/salt
	rm -rf /etc/slik
        rm -rf /var/www/html/pub/*
	rm -rf /srv/pillar
	rm -rf /srv/salt
fi

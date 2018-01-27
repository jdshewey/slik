# What is a SLIK stack?
SLIK stands for [Saltstack](https://saltstack.com/), [Linux](https://www.centos.org), [IPA](https://www.freeipa.org/page/Main_Page) and [Katello](https://github.com/Katello/katello). This is essentially a [Red Hat Satellite 6](https://access.redhat.com/products/red-hat-satellite) + [FreeIPA](https://www.freeipa.org/page/Main_Page) user (LDAP and Kerberos) and DNS management, configuration management and system deployment stack. FreeIPA and Satellite 6 really fit together like a hand in a glove, but oddly, FreeIPA is not included as part of the Satellite 6 stack. Furthermore, Satellite 6 is really based on Katello. The Katello project brings together the [Candlepin](http://www.candlepinproject.org/) license management system and [Pulp](http://pulpproject.org/) backends with heavy [Kickstart](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-howto.html) server deployment script integration as well as loose [Docker](https://www.docker.com/) container management. Katello is then skinned with [The Foreman](https://www.theforeman.org/) front end. More recently, it appears that Katello is merging into The Foremen having moved all of the Katello docs to their site. This means that the Katello stack (minus Candlepin license management) is available for all CentOS servers and that your CentOS server can manage all of your RedHat servers (including licensing) or vice-versa. Katello also integrates with numerous virtualization systems and cloud providers including VMWare, OpenStack, Amazon Web Services, [Google's cloud](https://cloud.google.com) platform, [Rackspace](https://www.rackspace.com) and [others](https://theforeman.org/manuals/latest/index.html#5.2ComputeResources). This helps to prevent you from being tied to a specific cloud by using, for example, Amazon's automated deployment and continuous deployment tools. You can freely move between clouds or your own environment.

# What are you up to?
This project aims to be a full Salt Stack based replacement for the foreman installer (which uses Puppet) with a few lofty future goals to bring better Salt and FreeIPA integration to The Foreman.

# How do I use it?
Unforutnately, this is not yet a working product. In the meantime, please try out the [katello formula](https://github.com/jdshewey/salt-formula-katello) and [SLIK installer](https://github.com/jdshewey/slik-installer). If you would like to contribute, this framework is intended to be really similar to the katello formula and uses a fork of the SLIK installer. So, to start developing:

 1. wget https://raw.githubusercontent.com/jdshewey/slik/master/slik.sh
 2. chmod +x slik.sh
 3. ./slik.sh --develop
 4. use https://github.com/salt-formulas/salt-formula-freeipa to install freeipa with DNS
 5. Begin working to make katello install without puppet alongside freeIPA
 6. Once install is working, merge in everything from the katello formula after IPA is installed

# Contributing
See the [isses](https://github.com/jdshewey/slik/issues) and [milestones](https://github.com/jdshewey/slik/milestones), fork the project and begin tackling one of these. Once you think you have a working formula, create a pull request for review. Your help on this prject is greatly appreciated!

 * A list of issues and a roadmap is available at https://github.com/jdshewey/slik/issues
 * If you decide to work on the python module, be sure to lint your code using pylint

#  Attribution
Created by James Shewey<br>
jdshewey.com<br>
jdshewey@gmail.com<br>	 

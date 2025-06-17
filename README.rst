##########################
  Run SAP as a Container
##########################

I will be using Proxmox as hypervisor.

Proxmox natively suports LXC containers.
To run Docker containers I will create a container template with needed packages (primarily ``curl`` and ``docker``).


Proxmox
=======


Create a container template

Download latest Ubuntu LTS (2404.2-2).

Do the usual post install house keeping chores.

.. code:: bash

  apt update && apt upgrade -y

Needed?

.. code::

  systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

https://www.tecmint.com/disable-suspend-and-hibernation-in-linux/

As both Ubuntu and RaspberryOS are based on Debian scripts can be quite similar.
Follow:
https://raspberrytips.com/docker-compose-raspberry-pi/

.. code::

  apt install curl

SAP
===

https://community.sap.com/t5/technology-blogs-by-sap/abap-cloud-developer-trial-2022-available-now/ba-p/13598069

https://community.sap.com/t5/enterprise-resource-planning-blogs-by-sap/containerizing-sap-s-4hana-systems-with-docker/ba-p/13581243

Installing Docker
-----------------

Follow the steps in: 
https://docs.docker.com/engine/install/fedora/

The general installation guide is here:
https://docs.docker.com/engine/install/

Verify installation:

.. code:: bash

  docker

How to use Docker Desktop 
~~~~~~~~~~~~~~~~~~~~~~~~~

| Docker Desktop is a licensed product, and is not IBM compliant.
| Docker CLI and various tools are FOSS -- still; please observe the licenses.
| I will only use Docker CLI as it gives me the most freedom and options.

Downloading image
-----------------

.. code:: bash

  sudo docker pull sapse/abap-cloud-developer-trial:ABAPTRIAL_2022_SP01

Note: You need to include a tag as :code:`:latest` is not supported.

| This will take a *long* while as it will download ????
| You should check your power settings so your workstation does not go to hibernate mode.

You can verify


Cite:

  ABAP Cloud Developer Trial is a free, downloadable ABAP Platform on SAP HANA 2.0 for trying out the ABAP language and toolset. It is extensively pre-configured with SAP Fiori launchpad, SAP Cloud Connector, pre-configured backend /frontend connections, roles, and sample applications.

Docker hub
----------

https://hub.docker.com/r/sapse/abap-cloud-developer-trial

Requirements

32GB for image
16GB for Docker itself

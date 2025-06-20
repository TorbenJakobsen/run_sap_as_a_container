##########################
  Run SAP as a Container
##########################

I will be using Proxmox as hypervisor.

Proxmox natively suports LXC containers.
To run Docker containers I will create a container template with needed packages (primarily ``curl`` and ``docker``).

https://github.com/TorbenJakobsen/run-docker-in-proxmox-lxc-container

*******
  SAP
*******

- https://community.sap.com/t5/technology-blogs-by-sap/abap-cloud-developer-trial-2022-available-now/ba-p/13598069
- https://community.sap.com/t5/enterprise-resource-planning-blogs-by-sap/containerizing-sap-s-4hana-systems-with-docker/ba-p/13581243

Download Docker Image
=====================

.. code:: bash

  sudo docker pull sapse/abap-cloud-developer-trial:ABAPTRIAL_2022_SP01

Note: You *must* include a tag as :code:`:latest` is not supported.

This will take a *long* time as the pull will download and extract ~58GB.
If you are on a slow connection, you should check your power settings so your workstation does not go to hibernate mode.

.. image:: ./media/docker_pull.png
  :align: left
  :width: 700 px

If you see "disk quota exceeded"

.. image:: ./media/disk_quota_exceeded.png
  :align: left
  :width: 740 px

This can also be seen in the summary tile:

.. image:: ./media/ct_tile.png
  :align: left
  :width: 460 px

And be verified in the filesystem.

.. image:: ./media/cli_df.png
  :align: left
  :width: 580 px

You can resize and run again.

.. code:: bash

  pct resize 100 rootfs 100G

The :code:`docker pull` have used up approximately 54GB disk space.

.. image:: ./media/cli_df_after_pull.png
  :align: left
  :width: 560 px

You can verify

.. image:: ./media/docker_images.png
  :align: left
  :width: 800 px

And used resources more generally

.. image:: ./media/docker_system_df.png
  :align: left
  :width: 500 px

Cite:

  ABAP Cloud Developer Trial is a free, downloadable ABAP Platform on SAP HANA 2.0 
  for trying out the ABAP language and toolset. 
  It is extensively pre-configured with SAP Fiori launchpad, SAP Cloud Connector, 
  pre-configured backend /frontend connections, roles, and sample applications.

Docker Hub has documentation:
https://hub.docker.com/r/sapse/abap-cloud-developer-trial

Requirements
============

RAM requirements from SAP:

- 32GB for image
- 16GB for Docker itself

*********
  Notes
*********

Docker Desktop 
==============

#. Docker Desktop is a *licensed* product, and is *not* IBM compliant.
#. Docker CLI and various tools are FOSS -- still; please observe the licenses.
#. I will only use Docker CLI as it gives me the most freedom and options (and... it is the only option while inside a container).


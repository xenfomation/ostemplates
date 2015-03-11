﻿
##[ Tanglu GNU/Linux 2 (Bartholomea Annulata) ]################################
# 2014-215, JK Benedict | @xenfomation | thexenfomation@gmail.com
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Tanglu GNU/Linux 2 (Bartholomea Annulata)")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Tanglu GNU/Linux 2 (Bartholomea Annulata).  The installer can be downloaded from http://www.tanglu.org/" \
    memory-static-max=536870912 \
    memory-dynamic-max=536870912 \
    memory-dynamic-min=536870912 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-arch=amd64 \
	other-config:install-distro=debianlike \
	other-config:disks='<provision><disk device="0" size="6442450944" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:nx=true \
	platform:device_id=0001 \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"

xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name

xe template-list uuid=$dstUUID

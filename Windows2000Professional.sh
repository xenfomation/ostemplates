#!/usr/bin/bash

##[ Windows 2000 Server ]######################################################
# 2014-2016, JK Benedict | http://xenfomation.wordpress.com | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Windows XP SP3 (32-bit)" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Windows 2000 Professional (32-bit)")

xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Windows 2000 Professional (32-bit) from Microsoft.  Recommended to have 128MB RAM and at least 5GB hard disk space." \
    memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
	other-config:install-methods=cdrom \
	other-config:disks='<provision><disk device="0" size="5368709120" sr="" bootable="true" type="system"/></provision>' \
	other-config:default_template=true \
	platform:nx=false \
	platform:vga=std \
	platform:videoram=8 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=true \
	platform:viridian_time_ref_count=true \
	platform:viridian_reference_tsc=true \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="dc" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID





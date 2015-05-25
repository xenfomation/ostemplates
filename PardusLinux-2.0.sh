
##[ Pardus Linux 2.0 ]#########################################################
# 2014-2015, JK Benedict | http://www.xenserver.org | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Pardus Linux 2.0")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Pardus Linux 2.0 from http://www.pardus.org.tr/" \
	memory-static-max=1073741824 \
	memory-dynamic-max=1073741824 \
	memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:install-arch=amd64 \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID

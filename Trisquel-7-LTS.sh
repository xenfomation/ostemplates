
##[ Trisquel GNU/Linux 7.0 ]###################################################
# 2014-215, JK Benedict | @xenfomation | thexenfomation@gmail.com
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Trisquel GNU/Linux 7.0")

xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Trisquel GNU/Linux 7.0. The installer media can be downloaded from http://trisquel.info/" \
    memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-distro=debianlike \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-arch=x86_64 \
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

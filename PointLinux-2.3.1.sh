
##[ Point Linux 2.3.1 (Taya) ]#################################################
# 2015, JK Benedict | @xenfomation | thexenfomation@gmail.com
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Point Linux 2")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE: Point Linux 2.3.1 (Taya) from http://pointlinux.org/" \
	memory-static-max=268435456 \
	memory-static-min=134217728 \
    memory-dynamic-max=268435456 \
    memory-dynamic-min=268435456 \
	other-config:install-distro=debianlike \
	other-config:install-arch=amd64 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="5368709120" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:nx=true \
	platform:device_id=0001 \
	platform:viridian=false \
    PV-args="-- quiet console=hvc0" \
	PV-bootloader=eliloader \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID

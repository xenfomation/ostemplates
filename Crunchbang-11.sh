
##[ CrunchBang 11 (Waldorf) ]##################################################
# 2014-2015, JK Benedict | http://www.xenserver.org | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="CrunchBang 11 (Waldorf)")

xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for CrunchBang 11 (Waldorf) from http://crunchbang.org/download/" \
    memory-static-max=536870912 \
	memory-static-min=268435456 \
    memory-dynamic-max=536870912 \
    memory-dynamic-min=536870912 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-distro=debianlike \
	other-config:disks='<provision><disk device="0" size="4294967296" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=8 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID
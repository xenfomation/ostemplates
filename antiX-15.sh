
##[ antiX 15 ]#################################################################
# 2014-2015, JK Benedict | http://www.xenserver.org | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="antiX 15")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for antiX 15 from http://ftp.cc.uoc.gr/mirrors/linux/mxlinux/MX-krete/" \
	memory-static-max=268435456 \
	memory-static-min=134217728 \
    memory-dynamic-max=268435456 \
    memory-dynamic-min=268435456 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-distro=debianlike \
	other-config:disks='<provision><disk device="0" size="2147483648" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:vga=std \
	platform:videoram=8 \
	platform:nx=true \
	platform:device_id=0001 \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID


##[ Linux Mint LMDE 2 (Betsy) ###############a###################################
# 03-MAY-2015, JK Benedict | http://www.xenserver.org | @xenfomation
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Linux Mint LMDE 2 (Betsy)")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Linux Mint LMDE 2 (Betsy) from http://www.linuxmint.com/download_lmde.php" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:hpet=true \
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
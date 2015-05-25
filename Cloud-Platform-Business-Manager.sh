
##[ CPBM CentOS 6.3 ]##########################################################
# 2015, JK Benedict | http://www.xenserver.org | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="CPBM CentOS 6.3")
xe template-param-set uuid=$dstUUID \
    name-description="CPBM Template: Requires CentOS 6.3 or CentOS 6.4 (64-bit) with no less that 2GB of RAM and 30GB of virtual hard disk space" \
    memory-static-max=2147483648 \
    memory-dynamic-max=2147483648 \
    memory-dynamic-min=2147483648 \
	other-config:default_template=true \
	other-config:linux_template=true \
	other-config:install-methods=cdrom,nfs,http,ftp \
	other-config:rhel6=true \
	other-config:disks='<provision><disk device="0" size="32212254720" sr="" bootable="true" type="system"/></provision>' \
	other-config:install-arch=x86_64 \
	other-config:install-distro=rhlike \
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

echo "xe template-param-set uuid=$dstUUID other-config:default_template=false" > /tmp/ostemplateCPBM.sh
chmod 755 /tmp/ostemplateCPBM.sh
echo "xe template-uninstall template-uuid=$dstUUID" >> /tmp/ostemplateCPBM.sh
echo "rm /tmp/ostemplateCPBM.sh" >> /tmp/ostemplateCPBM.sh
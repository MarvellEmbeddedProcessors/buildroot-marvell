#############################################################
#
# dt
#
#############################################################
DT_VERSION:=15.14
DT_SOURCE:=dt-source.tar.gz
DT_SITE:=http://www.scsifaq.org/RMiller_Tools/ftp/dt
DT_SUBDIR = dt.d-WIP

define DT_BUILD_CMDS
	$(MAKE) -C $(@D)/$(DT_SUBDIR) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS) -D__GNUC__ -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE" makedep
	$(MAKE) -C $(@D)/$(DT_SUBDIR) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS) -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64"
endef

define DT_CONFIGURE_CMDS
	cd $(@D)/$(DT_SUBDIR); ln -sf Makefile.linux Makefile
endef

define DT_INSTALL_TARGET_CMDS
	install -D $(@D)/${DT_SUBDIR}/dt $(TARGET_DIR)/usr/bin/dt
endef

define DT_CLEAN_CMDS
	rm -f $(TARGET_DIR)/usr/bin/dt
	-$(MAKE) -C $(@D)/${DT_SUBDIR} clean
endef

$(eval $(generic-package))
$(eval $(package,dt))

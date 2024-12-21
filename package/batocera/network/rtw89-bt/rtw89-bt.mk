################################################################################
#
# rtw89-bt
#
################################################################################
# Version: Commits on Dec 4, 2023
RTW89_BT_VERSION = 5c20a3c056e74ff9287d09f2d37ad9ea299292af
RTW89_BT_SITE = $(call github,lwfinger,rtw89-BT,$(RTW89_BT_VERSION))
RTW89_BT_LICENSE = GPL-2.0
RTW89_BT_LICENSE_FILES = LICENSE

RTW89_BT_MODULE_MAKE_OPTS = \
	CONFIG_RTW89_BT=m \
	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
		-Wno-error"

define RTW89_BT_MAKE_SUBDIR
        (cd $(@D); ln -s . RTW89-BT)
endef

RTW89_BT_PRE_CONFIGURE_HOOKS += RTW89_BT_MAKE_SUBDIR

$(eval $(kernel-module))
$(eval $(generic-package))

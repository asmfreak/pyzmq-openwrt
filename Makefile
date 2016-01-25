include $(TOPDIR)/rules.mk
PKG_NAME:=pyzmq
PKG_VERSION:=14.5.0
PKG_RELEASE:=1
PKG_SOURCE:=pyzmq-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/p/pyzmq/
PKG_MD5SUM:=8d3351a8ca2ca2a272a3f96bcb963e41
PKG_BUILD_DIR:=$(BUILD_DIR)/pyzmq-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python
include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
define Package/pyzmq
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=pyzmq
  URL:=http://pypi.python.org/pypi/pyzmq/
  DEPENDS:=+python +librt +libstdcpp
endef

define Package/pyzmq/description
  PyZMQ is the official Python binding for the ZeroMQ Messaging Library
endef

define Build/Compile
	$(call Build/Compile/PyMod,, install --zmq=bundled --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/pyzmq/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,pyzmq))

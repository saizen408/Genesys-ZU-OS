FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://wpa_supplicant-wlan0.conf"

SYSTEMD_AUTO_ENABLE = "enable"

SYSTEMD_SERVICE:${PN}:append = " wpa_supplicant@wlan0.service "

do_install:append () {
   install -d ${D}${sysconfdir}/wpa_supplicant/
   install -m 600 ${WORKDIR}/wpa_supplicant-wlan0.conf ${D}${sysconfdir}/wpa_supplicant/wpa_supplicant-wlan0.conf

   install -d ${D}${sysconfdir}/systemd/system/multi-user.target.wants/
   ln -s ${systemd_unitdir}/system/wpa_supplicant@.service ${D}${sysconfdir}/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service
}

CONFFILES:${PN} += "${sysconfdir}/wpa_supplicant-wlan0.conf"
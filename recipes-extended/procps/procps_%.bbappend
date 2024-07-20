FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:qcom = " file://tmpfiles.conf"

do_install:append:qcom() {
    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
        install -D -m 0644 ${WORKDIR}/tmpfiles.conf ${D}${nonarch_libdir}/tmpfiles.d/coredump.conf
    fi
}

FILES:${PN} += "${nonarch_libdir}/tmpfiles.d/coredump.conf"
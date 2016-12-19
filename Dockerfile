FROM fedora:25

RUN dnf -y install 'dnf-command(copr)' && \
    dnf -y copr enable asamalik/mbs && \
    dnf -y install module-build-service fedpkg

ADD files/config.py /etc/module-build-service/config.py

VOLUME /results
VOLUME /source

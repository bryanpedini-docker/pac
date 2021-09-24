FROM debian:stretch

RUN apt-get update && \
    apt-get install -y \
     libgnome2-gconf-perl \
     libexpect-perl \
     libnet-proxy-perl \
     libcrypt-cbc-perl \
     libcrypt-blowfish-perl \
     libgtk2-gladexml-perl \
     libgtk2-ex-simple-list-perl \
     libnet-arp-perl \
     libossp-uuid-perl \
     libcrypt-rijndael-perl \
     libgtk2-unique-perl \
     gtk2-engines-pixbuf \
     libvte9 \
     libsocket6-perl \
     libyaml-perl \
     libxml-parser-perl \
     libvte-dev \
     libextutils-depends-perl \
     libextutils-pkgconfig-perl \
     dh-make-perl \
     apt-file \
     openssh-client \
     telnet \
     ftp && \
    apt-file update && \
    dh-make-perl --cpan Gnome2::Vte --build && \
    dpkg -i libgnome2-vte-perl_0.12-1_amd64.deb
COPY pac-4.5.5.7-all.deb /root/pac-4.5.5.7-all.deb
RUN dpkg -i /root/pac-4.5.5.7-all.deb && \
    find /opt/pac/ -name "Vte.so*" -exec rm {} \; && \
    useradd \
     --create-home \
     --user-group \
     user
USER user
ENTRYPOINT [ "pac" ]

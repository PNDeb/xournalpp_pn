FROM arm64v8/debian:bookworm

RUN echo 'deb-src http://deb.debian.org/debian bookworm main' >> /etc/apt/sources.list
RUN echo 'deb-src http://deb.debian.org/debian-security bookworm-security main' >> /etc/apt/sources.list
RUN echo 'deb-src http://deb.debian.org/debian bookworm-updates main' >> /etc/apt/sources.list
RUN apt update

RUN apt -y upgrade
RUN apt -y install vim-nox git

RUN apt -y build-dep xournalpp

RUN mkdir /root/xpp
# COPY *.patch /root/xpp/
COPY compile.sh /root/xpp/

# WORKDIR /root/mutter
# CMD /root/mutter/compile.sh

ENTRYPOINT /root/xpp/compile.sh

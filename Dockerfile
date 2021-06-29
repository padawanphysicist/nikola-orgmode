FROM python:3.9.5-buster
MAINTAINER Victor santos <victor_santos@fisica.ufc.br>

###############################################################################80
### Install basic packages.
###############################################################################80
RUN echo 'deb-src http://deb.debian.org/debian/ buster main non-free contrib ' \
    >> /etc/apt/sources.list && \
    apt -yy update && apt -yy install build-essential git && \
    apt -yy build-dep emacs25

###############################################################################80
### Create normal user named =tesla=
###############################################################################80
RUN useradd -ms /bin/bash tesla
RUN echo 'tesla ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN [ -d /home/tesla/src/dist/ ] || mkdir -p /home/tesla/src/dist/

###############################################################################80
### Download GNU Emacs
###############################################################################80
WORKDIR /home/tesla/src/dist/
RUN git clone --depth 1 git://git.savannah.gnu.org/emacs.git

###############################################################################80
### Install Emacs
###############################################################################80
WORKDIR /home/tesla/src/dist/emacs
RUN ./autogen.sh && \
    ./configure && \
    make bootstrap && \
    make install && \
    make clean

###############################################################################80
### Install Nikola
###############################################################################80
WORKDIR /home/tesla
RUN pip install -U pip setuptools wheel && \
    pip install -U "Nikola[extras]" && \
    nikola plugin -i orgmode

###############################################################################80
### Go back to the home dir
###############################################################################80
WORKDIR /home/tesla/
RUN rm -rf src
# and now we install Emacs packages
ADD install.el /home/tesla/install.el
RUN emacs -Q --batch --load install.el

### Dockerfile ends here.

FROM alpine:3.12

# glibc-locale-source \
RUN apk upgrade && \
    apk add \
    coreutils\
    acl \
    bzip2 \
    file \
    findutils \
    gcc \
    git \
    iproute2 \
    libffi \
    libffi-dev \
    make \
    openssh-client \
    openssh-server \
    openssl-dev \
    pass \
    procps \
    py3-cryptography \
    py3-dbus \
    python3-dev \
    py3-httplib2 \
    py3-jinja2 \
    py3-lxml \
    py3-mock \
    py3-nose \
    py3-packaging \
    py3-pip \
    py3-yaml \
    py3-setuptools \
    py3-virtualenv \
    ruby \
    ruby-rdoc \
    sshpass \
    subversion \
    sudo \
    tar \
    unzip \
    which \
    zip

#RUN localedef --quiet -c -i en_US -f UTF-8 en_US.UTF-8
RUN mkdir /etc/ansible/
RUN echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts
VOLUME /sys/fs/cgroup /run /tmp
RUN ssh-keygen -q -t dsa -N '' -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -m PEM -q -t rsa -N '' -f /root/.ssh/id_rsa && \
    cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys && \
    for key in /etc/ssh/ssh_host_*_key.pub; do echo "localhost $(cat ${key})" >> /root/.ssh/known_hosts; done
RUN pip3 install 'coverage<5' junit-xml passlib
ENV container=docker
CMD ["/sbin/init"]

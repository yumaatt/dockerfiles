FROM ubuntu:14.04

MAINTAINER yuma

RUN apt-get -y update

RUN apt-get -y install vim git
RUN apt-get -y install openssh-server
# for ansible to use apt_repository in check mode. this will be unnecessary in 2.1.0.
RUN apt-get -y install python-apt
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd

RUN useradd docker -m -s /bin/bash
RUN echo 'docker:docker' | chpasswd
RUN echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/docker

# Set up SSH
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
#ADD authorized_keys /home/docker/.ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDpDXZBgoDRK5Eg5xD1+kJYwLeGNbzBdkomVOLzr/KYbux2m/ojm+ULmGvFMVORLkKdhWLIBlskbeJ93Jn78K/Ysp3TqfQ/HW7kUPe/VUoELBR1RigTnUEM6pSpNiNJ4cqVHwowMyXl0Ca+3jG/0Sz3tKbREFdJhF2t2oi3BXOx9w== vagrant@dev1" >> /home/docker/.ssh/authorized_keys

RUN chown docker /home/docker/.ssh/authorized_keys
RUN chmod 600 /home/docker/.ssh/authorized_keys

RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

EXPOSE 22
CMD    ["/usr/sbin/sshd",  "-D"]

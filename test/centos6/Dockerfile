# Dockerfile
FROM centos:6.7

MAINTAINER yuma

RUN yum -y update

# install package
RUN yum -y install vim git
RUN yum -y install passwd openssh openssh-server openssh-clients sudo

# Create user
RUN useradd docker
RUN passwd -f -u docker

# Set up SSH
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
#ADD authorized_keys /home/docker/.ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQDpDXZBgoDRK5Eg5xD1+kJYwLeGNbzBdkomVOLzr/KYbux2m/ojm+ULmGvFMVORLkKdhWLIBlskbeJ93Jn78K/Ysp3TqfQ/HW7kUPe/VUoELBR1RigTnUEM6pSpNiNJ4cqVHwowMyXl0Ca+3jG/0Sz3tKbREFdJhF2t2oi3BXOx9w== vagrant@dev1" >> /home/docker/.ssh/authorized_keys

RUN chown docker /home/docker/.ssh/authorized_keys
RUN chmod 600 /home/docker/.ssh/authorized_keys

# setup sudoers
RUN echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/docker

# Set up SSHD config
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Init SSHD
RUN /etc/init.d/sshd start
RUN /etc/init.d/sshd stop

# Set up SSHD
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

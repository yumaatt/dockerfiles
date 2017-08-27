# Dockerfile
FROM centos:7

MAINTAINER yuma

RUN yum -y update

# install package
RUN yum -y install emacs vim git
RUN yum -y install passwd openssh openssh-server openssh-clients sudo

# Create user
RUN useradd docker
RUN passwd -f -u docker

# Set up SSH
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
#ADD authorized_keys /home/docker/.ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwmGKPoCfesYWbo+VXlp0EJ7VlB5hLMKu59oBLZIDU4itilTqH8r+wX75f+zUg62IM/I/cMxc0Owhrd+iKNkibV+Hf+a0Lz1/31Hduccb4lLwSzEPVs/HL5ITMK64k5JfWpfP1JjM6eaX9hENqRQkoauAFtTKzqYFE6Jl6ND4hPWTU5pyotjt3bi1i9UkSbufH1SrHv4IJ7j+ACDw3bSQ86i6JJsi13isNFZJS0W3Ki3uRDhMKubAQy1ppEkXVwwcQQ1fUnMFAxdbEDXuJHKI2feRASZPywy0f2vPp8lN/cYtqtNpbXrLo0hHd1yug/FCp3s0vBLflapyI/gZFVJGN yuma.takahashi@52474-mac.local" >> /home/docker/.ssh/authorized_keys

RUN chown docker /home/docker/.ssh/authorized_keys
RUN chmod 600 /home/docker/.ssh/authorized_keys

# setup sudoers
RUN echo "docker ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/docker

# Set up SSHD config
RUN sed -ri 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config

# Init SSHD
RUN /usr/bin/ssh-keygen -A
RUN /usr/sbin/sshd -D &

EXPOSE 22
CMD ["/sbin/init"]

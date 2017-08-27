FROM ubuntu:15.04

MAINTAINER yuma

RUN apt-get -y update

RUN apt-get -y install emacs vim git
RUN apt-get -y install openssh-server sudo
# for ansible to use apt_repository in check mode. this will be unnecessary in 2.1.0.
RUN apt-get -y install python-apt python-minimal
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd

RUN useradd docker -m -s /bin/bash
RUN echo 'docker:docker' | chpasswd
RUN echo 'docker ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/docker

# Set up SSH
RUN mkdir -p /home/docker/.ssh; chown docker /home/docker/.ssh; chmod 700 /home/docker/.ssh
#ADD authorized_keys /home/docker/.ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwmGKPoCfesYWbo+VXlp0EJ7VlB5hLMKu59oBLZIDU4itilTqH8r+wX75f+zUg62IM/I/cMxc0Owhrd+iKNkibV+Hf+a0Lz1/31Hduccb4lLwSzEPVs/HL5ITMK64k5JfWpfP1JjM6eaX9hENqRQkoauAFtTKzqYFE6Jl6ND4hPWTU5pyotjt3bi1i9UkSbufH1SrHv4IJ7j+ACDw3bSQ86i6JJsi13isNFZJS0W3Ki3uRDhMKubAQy1ppEkXVwwcQQ1fUnMFAxdbEDXuJHKI2feRASZPywy0f2vPp8lN/cYtqtNpbXrLo0hHd1yug/FCp3s0vBLflapyI/gZFVJGN yuma.takahashi@52474-mac.local" >> /home/docker/.ssh/authorized_keys

RUN chown docker /home/docker/.ssh/authorized_keys
RUN chmod 600 /home/docker/.ssh/authorized_keys

RUN useradd isucon -m -s /bin/bash
RUN echo 'isucon:isucon' | chpasswd
RUN echo 'isucon ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/isucon

# Set up SSH
RUN mkdir -p /home/isucon/.ssh; chown isucon /home/isucon/.ssh; chmod 700 /home/isucon/.ssh
#ADD authorized_keys /home/isucon/.ssh/authorized_keys
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCwmGKPoCfesYWbo+VXlp0EJ7VlB5hLMKu59oBLZIDU4itilTqH8r+wX75f+zUg62IM/I/cMxc0Owhrd+iKNkibV+Hf+a0Lz1/31Hduccb4lLwSzEPVs/HL5ITMK64k5JfWpfP1JjM6eaX9hENqRQkoauAFtTKzqYFE6Jl6ND4hPWTU5pyotjt3bi1i9UkSbufH1SrHv4IJ7j+ACDw3bSQ86i6JJsi13isNFZJS0W3Ki3uRDhMKubAQy1ppEkXVwwcQQ1fUnMFAxdbEDXuJHKI2feRASZPywy0f2vPp8lN/cYtqtNpbXrLo0hHd1yug/FCp3s0vBLflapyI/gZFVJGN yuma.takahashi@52474-mac.local" >> /home/isucon/.ssh/authorized_keys

RUN chown isucon /home/isucon/.ssh/authorized_keys
RUN chmod 600 /home/isucon/.ssh/authorized_keys

RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

RUN /usr/sbin/sshd -D &

EXPOSE 22
CMD ["/sbin/init"]

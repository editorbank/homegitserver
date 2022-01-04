FROM ubuntu

RUN apt-get -y update
RUN echo "8\n34\n" | apt-get -q -y install ssh
RUN apt-get -y install git
RUN echo "git\ngit\ngit\n\n\n\n\nY\n" | adduser --home /git git

#COPY sshd_config /etc/ssh/sshd_config
COPY id_rsa.pub /etc/ssh/.ssh/authorized_keys
COPY id_rsa.pub /git/.ssh/authorized_keys

RUN service ssh start

ENTRYPOINT cd /etc/ssh && /usr/sbin/sshd -De
EXPOSE 22

#ENTRYPOINT sleep 1d

FROM alpine

RUN apk add --no-cache git openssh-server openssh-client && \
 /usr/bin/ssh-keygen -A && \
 adduser -h /git -D git && \
 echo -e "git\ngit\n" | passwd git && \
 \
 echo OK

#COPY id_rsa.pub .ssh/authorized_keys
COPY id_rsa.pub /git/.ssh/authorized_keys

ENTRYPOINT cd /etc/ssh && /usr/sbin/sshd -De
EXPOSE 22

FROM alpine

RUN apk add --no-cache git openssh-server openssh-client && \
 /usr/bin/ssh-keygen -A && \
 \
 echo OK

COPY ./src/sshd_config /etc/ssh/sshd_config
COPY ./tmp/public_key.tmp /etc/ssh/.ssh/authorized_keys
COPY ./src/lsrepo /usr/local/bin/lsrepo
COPY ./src/mkrepo /usr/local/bin/mkrepo
RUN chmod ugo=rx /usr/local/bin/lsrepo /usr/local/bin/mkrepo
COPY ./tmp/public_key.tmp /root/.ssh/authorized_keys
RUN [ ! -d /repos ] && mkdir /repos

VOLUME /repos
ENTRYPOINT cd /etc/ssh && /usr/sbin/sshd -De
EXPOSE 22

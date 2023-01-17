FROM alpine




RUN apk add --no-cache git openssh-server openssh-client && \
 /usr/bin/ssh-keygen -A && \
 adduser -h /home/git -D git && \
 echo -e "git\ngit\n" | passwd git && \
 \
 echo OK
# chmod ugo=rwx /home/git && \

COPY ./src/sshd_config /etc/ssh/sshd_config
COPY ./public_key.tmp /etc/ssh/.ssh/authorized_keys
COPY ./src/lsrepo /usr/local/bin/lsrepo
COPY ./src/mkrepo /usr/local/bin/mkrepo
RUN chmod ugo=rx /usr/local/bin/lsrepo /usr/local/bin/mkrepo
COPY ./public_key.tmp /home/git/.ssh/authorized_keys
USER git
RUN [ ! -d /home/git/repos ] && mkdir /home/git/repos
#VOLUME /home/git/repos

USER root
ENTRYPOINT cd /etc/ssh && /usr/sbin/sshd -De
EXPOSE 22

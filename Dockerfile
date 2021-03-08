FROM alpine:latest

RUN apk --update add curl openssh && ssh-keygen -A && rm -rf /var/cache/apk/*
RUN sed -i -e "s/AllowTcpForwarding no/AllowTcpForwarding yes/" /etc/ssh/sshd_config
RUN adduser -S -s /bin/ash ssh-user && passwd -d ssh-user
COPY run.sh /

EXPOSE 22
ENTRYPOINT ["/run.sh"]

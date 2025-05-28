FROM almalinux:9

RUN dnf -y install epel-release; \
    dnf -y install httpd java-21-openjdk
COPY elisa.repo /etc/yum.repos.d/elisa.repo
RUN dnf -y install gettext elisa mariadb
RUN dnf -y update
RUN sed -i 's/PROFILE=".*"/PROFILE="spring.profiles.active=mysql-local"/g' /var/local/elisa/elisa.conf
COPY application-mysql-local.properties.template /
COPY start.sh /start.sh
RUN chmod +x /start.sh && chown logbook:logbook /start.sh
USER logbook
ENTRYPOINT ["/start.sh"]

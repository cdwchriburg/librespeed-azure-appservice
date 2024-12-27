FROM ghcr.io/librespeed/speedtest

# Disable Client-IP header since Azure App Service behind private endpoint sets this to a ULA IPv6 address instead of the actual client IPv4 address

# Very janky setup, just basic testing/validation that this works
RUN ln -s /etc/apache2/mods-available/headers.load /etc/apache2/mods-enabled/headers.load
RUN sed -i 's/<Directory \/var\/www\/>/<Directory \/var\/www\/>\nHeader always unset CLIENT-IP\nRequestHeader unset X-Forwarded-For/' /etc/apache2/apache2.conf
RUN sed -i 's/<Directory \/var\/www\/>/<Directory \/var\/www\/>\nHeader always unset CLIENT-IP\nRequestHeader unset X-Forwarded-For/' /etc/apache2/conf-available/docker-php.conf

FROM ghcr.io/librespeed/speedtest

# Disable Client-IP header since Azure App Service behind private endpoint sets this to a ULA IPv6 address instead of the actual client IPv4 address

# Very janky - just swap out use of Client-IP header for X-Client-IP header (which has correct source ip)
RUN sed -i 's/HTTP_CLIENT_IP/HTTP_X_CLIENT_IP/g' /speedtest/backend/getIP_util.php
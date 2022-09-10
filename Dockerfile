# base image
FROM sgrtestsap/sap-cf-buildtools:latest

COPY entrypoint.sh /entrypoint.sh

# update downloaded folder permissions
RUN chmod +x /entrypoint.sh

# shell file to load once container invokes
ENTRYPOINT ["/entrypoint.sh"]
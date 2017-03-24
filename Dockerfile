FROM resin/raspberrypi-python:2.7
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT ["/bin/entrypoint.sh"]

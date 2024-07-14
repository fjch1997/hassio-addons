ARG BUILD_FROM
FROM $BUILD_FROM

COPY data/run.sh /
COPY data/Azure-DynDns /
COPY data/Azure-DynDns.pdb /
RUN chmod a+x /run.sh
RUN chmod a+x /Azure-DynDns

CMD [ "/run.sh" ]

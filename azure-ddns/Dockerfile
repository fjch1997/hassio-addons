ARG BUILD_FROM
FROM $BUILD_FROM

COPY run.sh /
COPY Azure-DynDns /
COPY Azure-DynDns.pdb /
RUN chmod a+x /run.sh
RUN chmod a+x /Azure-DynDns

CMD [ "/run.sh" ]

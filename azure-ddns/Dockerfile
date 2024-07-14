ARG BUILD_FROM
FROM $BUILD_FROM

COPY Azure-DynDns /
COPY Azure-DynDns.pdb /
RUN chmod a+x /Azure-DynDns

CMD [ "/run.sh" ]

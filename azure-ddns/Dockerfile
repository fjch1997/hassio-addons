ARG BUILD_FROM
FROM $BUILD_FROM

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
RUN chmod +x ./dotnet-install.sh
RUN ./dotnet-install.sh --channel 8.0

COPY data/run.sh /
COPY data/Azure-DynDns /
COPY data/Azure-DynDns.pdb /
RUN chmod a+x /run.sh
RUN chmod a+x /Azure-DynDns

CMD [ "/run.sh" ]

FROM microsoft/powershell

RUN apt-get update \
    && apt-get upgrade --yes \
    && apt-get install ffmpeg --yes \
    && mkdir /data \
    && pwsh -Command Install-Module -Name AWS.Tools.S3 -Force

ADD ["convert.ps1", "/data"]

WORKDIR /data

CMD ["pwsh", "-File", "/data/convert.ps1"]
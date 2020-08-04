FROM microsoft/powershell

RUN apt-get update && apt-get upgrade --yes \
    && apt-get install ffmpeg --yes \
    && pwsh -Command 'Install-Module -Name AWS.Tools.S3 -Force'

ADD ["app.ps1", "/data/"]

WORKDIR /data

CMD ["pwsh", "-File", "/data/app.ps1"]
FROM ubuntu:14.04.3

MAINTAINER Andreas Wålm <andreas@walm.net>

ENV DEBIAN_FRONTEND noninteractive

COPY AptSources /etc/apt/sources.list.d/

RUN useradd -m google-chrome; \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 1397BC53640DB551 \
    && apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
                                                  gconf-service \
                                                  hicolor-icon-theme \
                                                  libappindicator1 \
                                                  libasound2 \
                                                  libcurl3 \
                                                  libexif-dev \
                                                  libgconf-2-4 \
                                                  libgl1-mesa-dri \
                                                  libgl1-mesa-glx \
                                                  libnspr4 \
                                                  libnss3 \
                                                  libpango1.0-0 \
                                                  libv4l-0 \
                                                  libxss1 \
                                                  libxtst6 \
                                                  xdg-utils \
                                                  google-chrome-stable=60.0.3112.101-1 \
    && rm -rf /var/lib/apt/lists/*

COPY start-google-chrome.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/start-google-chrome.sh"]

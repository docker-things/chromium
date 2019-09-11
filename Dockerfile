FROM gui-apps-base:18.04
MAINTAINER Gabriel Ionescu <gabi.ionescu+dockerthings@protonmail.com>

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
        ubuntu-restricted-extras \
        libavcodec-extra \
        ca-certificates \
        curl \
        dirmngr \
        gnupg \
        libasound2 \
        libdbus-glib-1-2 \
        libgl1-mesa-dri \
        libgl1-mesa-glx \
        libxrender1 \
        libx11-xcb-dev \
        libx11-xcb1 \
        libxt6 \
        libpulse0 \
        bzip2 \
        libcanberra-gtk3-module \
        chromium-browser \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y

# ENV LIBGL_ALWAYS_SOFTWARE 1
# ENV LIBGL_DEBUG verbose

RUN ln -s /usr/bin/chromium-browser /usr/bin/chromium

# SET USER
USER $DOCKER_USERNAME

# ENTRYPOINT
ENTRYPOINT ["rm -rf /home/$DOCKER_USERNAME/.config/chromium/SingletonLock && /usr/bin/chromium"]

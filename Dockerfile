FROM eclipse-temurin:17-alpine

ENV CMDLINE_TOOLS_HOME=/opt/cmdline-tools

ENV PATH=$PATH:$CMDLINE_TOOLS_HOME/latest/bin

RUN apk add wget unzip

RUN echo "Downloading commandlinetools" \
    && wget --no-verbose --output-document=commandlinetools.zip "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip" \
    && echo "Installing commandlinetools" \
    && mkdir "${CMDLINE_TOOLS_HOME}" \
    && unzip commandlinetools.zip -d "${CMDLINE_TOOLS_HOME}" \
    && rm commandlinetools.zip \
    && mv "${CMDLINE_TOOLS_HOME}/cmdline-tools" "${CMDLINE_TOOLS_HOME}/latest/"

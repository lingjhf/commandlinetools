FROM alpine:3.21


ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

RUN echo "Downloading commandlinetools" \
    && wget --no-verbose --output-document=commandlinetools.zip "https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip" \
    && echo "Installing commandlinetools" \
    && mkdir "${ANDROID_HOME}" \
    && unzip commandlinetools.zip -d "${ANDROID_HOME}/cmdline-tools" \
    && rm commandlinetools.zip \
    && mv "${ANDROID_HOME}/cmdline-tools/cmdline-tools" "${ANDROID_HOME}/cmdline-tools/latest/"

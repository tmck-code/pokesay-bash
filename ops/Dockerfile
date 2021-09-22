FROM debian:latest

WORKDIR /usr/local/src/
RUN apt update && \
    apt install -y --no-install-recommends git parallel golang make gcc libmagickwand-dev ncurses-dev
RUN git clone --depth 1 git://github.com/msikma/pokesprite && \
    cp -R pokesprite/icons/ . && \
    rm -rf pokesprite
RUN git clone --depth 1 git://github.com/rossy/img2xterm && \
    cd img2xterm && \
    PATH="/usr/lib/x86_64-linux-gnu/ImageMagick-6.9.11/bin-q16:/usr/include/ImageMagick-6/:$PATH" make && \
    PATH="/usr/lib/x86_64-linux-gnu/ImageMagick-6.9.11/bin-q16:/usr/include/ImageMagick-6/:$PATH" make install

ADD ops/build.sh .

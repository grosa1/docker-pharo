FROM debian:stable-slim

# add dependencies
RUN apt-get update \
    && apt-get install -y \
        curl \
        unzip \
    && rm -rf /var/lib/apt/lists/*

# install pharo 
WORKDIR /opt/pharo

RUN curl -v https://get.pharo.org | bash
RUN ln -s /opt/pharo/pharo /usr/bin/pharo
RUN chmod +x /usr/bin/pharo

# set entrypoint
ENTRYPOINT ["pharo"]
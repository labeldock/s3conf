FROM debian:bookworm

# At the time of creating this script, Ruby3.1 was installed by default in Bookworm.
RUN apt update && \
    apt install -y ruby s3cmd && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/scripts
COPY ../s3conf.rb /root/scripts/s3conf.rb
COPY ./s3conf.sh /usr/local/bin/s3conf
RUN chmod +x /usr/local/bin/s3conf

FROM whatwg-html-build

RUN apt-get update && \
    apt-get install -y ca-certificates nginx && \
    rm -rf /var/lib/apt/lists/*

ADD . /whatwg/html

WORKDIR /whatwg/build
RUN /whatwg/build/build.sh && \
    cp -r /whatwg/build/output/* /var/www/html && \
    rm /var/www/html/index.nginx-debian.html && \
    mv /var/www/html/index /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]


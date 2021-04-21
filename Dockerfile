# docker build -f ./web_app_dockerfile_alpine -t web_app_con:1 .
# docker run -it -d -p 5000:5000 --name web_app_con web_app_con:1

From alpine:latest

ENV LC_ALL=en_US.utf-8
ENV LANG=en_US.utf-8

# install packages
RUN apk add git \
            python3


RUN git clone https://github.com/EfimovEO/student-exam2.git

ADD start_web_app.sh start_web_app.sh

EXPOSE 5000

# start flask
CMD /bin/sh start_web_app.sh

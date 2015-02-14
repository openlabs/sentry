FROM ubuntu:14.04
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y language-pack-en
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install python-dev -y
RUN apt-get install python-pip -y
RUN apt-get build-dep python-psycopg2 python-lxml -y

RUN easy_install -U distribute
RUN pip install sentry
RUN pip install gevent
RUN pip install eventlet
RUN pip install django-bcrypt
RUN pip install psycopg2 

# To adapt to your environment, replace
# this sentry.conf with your's
ADD sentry.conf.py /etc/sentry.conf.py

EXPOSE 9000 9001

ENTRYPOINT ["/usr/local/bin/sentry"]
CMD ["--config=/etc/sentry.conf.py", "start"]

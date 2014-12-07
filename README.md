Docker Sentry
=============

Dockerize sentry - As simple as that!

Why another one
---------------

Sentry configuration (or django configuration in general) is
better done using a file. This implementation lets you extend
the docker repo and add your own sentry.conf file and start
using.

Example usage
--------------

```
FROM openlabs/sentry

ADD sentry.conf.py /etc/sentry.conf.py
```

Thats it! and you can now run your container

```bash
docker run my_image_id
```

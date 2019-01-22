To test this installation, we will:

* install a network policy
* start 2 containers
* make a curl between them

First thing is to create a Network Access Policy in Aporeto:

```
apoctl api create netpol \
  -k name allow-centos-to-nginx \
  -k subject '[["$name=centos"]]' \
  -k object '[["$name=nginx"]]' \
  -k action Allow
```{{execute}}

Then we start an nginx container:

```
docker run -d --rm --name nginx nginx
```{{execute}}

We start an centos container:

```
docker run -it -d --rm --name centos centos
```{{execute}}

And we make a curl from centos to nginx:

```
docker exec -it centos curl "$(docker inspect nginx | jq -r '.[0].NetworkSettings.Networks.bridge.IPAddress')"
```{{execute}}

You can check now check in your training namespace that the
communication has been reported and allowed.

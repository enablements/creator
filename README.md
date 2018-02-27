# Git server for build
### set up
###### 1. build the build image  

```
cd creator/rootfs/stacks/java-jersey/build
docker build -t java-jersey-build .
```

###### 2. build the verify image
```
cd creator/rootfs/stacks/java-jersey/verify
docker build -t java-jersey-verify .
```


### start up
```
docker build -t creator .

docker run --rm --name creator -p81:80 \
-v /tmp/repos:/data/repos \
-v `pwd`/nginx.conf:/usr/local/openresty/nginx/conf/nginx.conf:ro \
-v /var/run/docker.sock:/var/run/docker.sock \
-v `pwd`/rootfs/home/git/builder:/home/git/builder \
creator
```
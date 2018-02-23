# Git server for build
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
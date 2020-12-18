docker run --name cloudera \
    --hostname=quickstart.cloudera \
    --privileged=true \
    -t -i \
    -p 8888:8889 \
    -p 8889:8889 \
    -v $(pwd)/home://home/cloudera/Documents \
    cloudera/quickstart:latest \
    /usr/bin/docker-quickstart
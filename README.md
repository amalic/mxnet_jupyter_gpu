# MX-Net Docker container

## build
```
nvidia-docker build -t mxnet/jupyter:gpu .
```

## run
```
docker run -d --runtime=nvidia --rm -p 8888:8888 -v <path>:/root/workspace/ mxnet/jupyter:gpu
```

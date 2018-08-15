FROM mxnet/python:gpu

RUN apt-get update && apt-get install -y python-pip python-opencv

RUN pip install --upgrade pip && \
  pip install ipython jupyter matplotlib opencv-python

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini

EXPOSE 8888

WORKDIR /root/workspace

VOLUME ["/root/workspace"]

ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''",  "--NotebookApp.password=''"]

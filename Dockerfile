FROM ubuntu:wily

RUN mkdir /syntaxnet
WORKDIR /syntaxnet

RUN apt-get -q update && \
  apt-get install --no-install-recommends -y --force-yes -q \
    build-essential \
    ca-certificates \
    wget \
    git \
    swig \
    openjdk-8-jdk \
    pkg-config zip g++ zlib1g-dev unzip \
    python python-pip \
    python-dev libpython-dev \
    python-numpy \
  && apt-get clean && \
  rm /var/lib/apt/lists/*_*
RUN update-ca-certificates -f

RUN pip install -U protobuf==3.0.0b2 asciitree && rm -rf /tmp/*
RUN wget https://github.com/bazelbuild/bazel/releases/download/0.2.2/bazel-0.2.2-installer-linux-x86_64.sh -O bazel-install.sh && chmod a+x bazel-install.sh && ./bazel-install.sh && rm bazel-install.sh

RUN git clone --recursive https://github.com/tensorflow/models.git

RUN cd models/syntaxnet/tensorflow && ./configure && cd .. && bazel --batch test --genrule_strategy=standalone --spawn_strategy=standalone syntaxnet/... util/utf8/...

WORKDIR /syntaxnet/models/syntaxnet


ADD http://download.tensorflow.org/models/parsey_universal/Swedish.zip /models/
RUN unzip /models/Swedish.zip
ENV MODEL_DIR=/syntaxnet/models/syntaxnet/Swedish/

ENTRYPOINT ["syntaxnet/demo.sh"]

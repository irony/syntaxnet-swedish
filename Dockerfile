FROM saturnism/syntaxnet
ADD http://download.tensorflow.org/models/parsey_universal/Swedish.zip /models/
RUN unzip /models/Swedish.zip
ENV MODEL_DIRECTORY=/syntaxnet/models/syntaxnet/Swedish/



# COMMANDS to build and run
# ===============================
# mkdir build && cp Dockerfile build/ && cd build
# docker build -t syntaxnet .
# docker run syntaxnet
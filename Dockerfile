FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install git
FROM python:3.9-slim
# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook jupyterlab

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
WORKDIR ${HOME}
USER ${USER}

RUN git clone https://github.com/WolframResearch/WolframLanguageForJupyter.git
CMD [ "bash", "./configure-jupyter.wls add" ]

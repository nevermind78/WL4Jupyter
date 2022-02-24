FROM python:3.9-slim
# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook jupyterlab
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN git clone https://github.com/WolframResearch/WolframLanguageForJupyter.git


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
CMD ["dpkg -i WolframScript_13.0.0_LINUX64_amd64.deb"]
WORKDIR WolframLanguageForJupyter
RUN ./configure-jupyter.wls add"]

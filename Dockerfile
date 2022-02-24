FROM rocker/binder:4.1.2

## Declares build arguments
ARG NB_USER
ARG NB_UID

COPY --chown=${NB_USER} . ${HOME}

ENV DEBIAN_FRONTEND=noninteractive
USER root
RUN echo "Checking for 'apt.txt'..." \
        ; if test -f "apt.txt" ; then \
        apt-get update --fix-missing > /dev/null\
        && xargs -a apt.txt apt-get install --yes \
        && apt-get clean > /dev/null \
        && rm -rf /var/lib/apt/lists/* \
        ; fi
USER ${NB_USER}

RUN wget https://files.wolframcdn.com/WolframEngine/13.0.0.0/WolframEngine_13.0.0_LINUX.sh?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839eb0c474b9195c272a438a9c23775a1240e74dd4dbf1da4068cb31f233e5315b1d56acfc159268aee609cfd582a1ab8854714067bbd2190811ff63c6849673be597f0eb74f02857c7LINUX_.sh
RUN bash https://files.wolframcdn.com/WolframEngine/13.0.0.0/WolframEngine_13.0.0_LINUX.sh?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839eb0c474b9195c272a438a9c23775a1240e74dd4dbf1da4068cb31f233e5315b1d56acfc159268aee609cfd582a1ab8854714067bbd2190811ff63c6849673be597f0eb74f02857c7LINUX_.sh
RUN rm WolframEngine_13.0.0_LINUX.sh?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839eb0c474b9195c272a438a9c23775a1240e74dd4dbf1da4068cb31f233e5315b1d56acfc159268aee609cfd582a1ab8854714067bbd2190811ff63c6849673be597f0eb74f02857c7LINUX_.sh

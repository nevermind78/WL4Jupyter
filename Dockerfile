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

RUN wget https://files.wolframcdn.com/WolframEngine/13.0.0.0/WolframEngine_13.0.0_LINUX.sh?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839e804440a93e83792d0ba1661898fe121aff39187f3cb77842aa8ea1d267e34ad25b5c8c342998f87037d7058cc7999a7dc59a4903391b8c16751e63bb4bce71626b3c14a609a7558LINUX_.sh
RUN bash WolframEngine_13.0.0_LINUX.sh\?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839e804440a93e83792d0ba1661898fe121aff39187f3cb77842aa8ea1d267e34ad25b5c8c342998f87037d7058cc7999a7dc59a4903391b8c16751e63bb4bce71626b3c14a609a7558LINU
RUN rm WolframEngine_13.0.0_LINUX.sh\?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839e804440a93e83792d0ba1661898fe121aff39187f3cb77842aa8ea1d267e34ad25b5c8c342998f87037d7058cc7999a7dc59a4903391b8c16751e63bb4bce71626b3c14a609a7558LINU

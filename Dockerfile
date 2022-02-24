ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
RUN wget https://files.wolframcdn.com/WolframEngine/13.0.0.0/WolframEngine_13.0.0_LINUX.sh?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839e804440a93e83792d0ba1661898fe121aff39187f3cb77842aa8ea1d267e34ad25b5c8c342998f87037d7058cc7999a7dc59a4903391b8c16751e63bb4bce71626b3c14a609a7558LINUX_.sh
RUN bash WolframEngine_13.0.0_LINUX.sh\?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839e804440a93e83792d0ba1661898fe121aff39187f3cb77842aa8ea1d267e34ad25b5c8c342998f87037d7058cc7999a7dc59a4903391b8c16751e63bb4bce71626b3c14a609a7558LINU
RUN rm WolframEngine_13.0.0_LINUX.sh\?4ae6ee529e4e0d5967853f9964b23dfeb8566c7eb008cacb7094260839e804440a93e83792d0ba1661898fe121aff39187f3cb77842aa8ea1d267e34ad25b5c8c342998f87037d7058cc7999a7dc59a4903391b8c16751e63bb4bce71626b3c14a609a7558LINU

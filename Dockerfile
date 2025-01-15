FROM debian:bookworm

WORKDIR /action

RUN apt-get -y update && apt-get -y install curl git wget
RUN curl -L https://raw.githubusercontent.com/Cyfrin/aderyn/dev/cyfrinup/install | bash
RUN $HOME/.cyfrin/bin/cyfrinup
RUN $HOME/.cyfrin/bin/aderyn -V
COPY entrypoint.sh entrypoint.sh

ENTRYPOINT ["/action/entrypoint.sh"]

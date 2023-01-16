FROM debian

LABEL description "An debian image prepared to be configured with awscli"
LABEL department "development"

WORKDIR /root

RUN mkdir .aws
RUN --mount=type=secret,id=credentials cat /run/secrets/credentials > .aws/credentials
RUN --mount=type=secret,id=config cat /run/secrets/config > .aws/config

RUN apt update && apt install -y vim awscli

RUN echo 'echo "тебя взломали хахаха :P \n"' >> .bashrc

CMD ["/bin/bash"]

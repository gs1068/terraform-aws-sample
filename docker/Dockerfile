FROM ubuntu:20.04

# install command.
RUN apt-get update && apt-get install -y less vim unzip curl && apt-get install git -y

# install awscli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    bash -c 'echo complete -C '/usr/bin/aws_completer' aws  >> $HOME/.bashrc'

# install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.0/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl


ENV PS1="awscliv2> "

# install terraform.
# https://azukipochette.hatenablog.com/entry/2018/06/24/004354
RUN curl "https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip" -o "terraform.zip" && \
    unzip ./terraform.zip -d /usr/local/bin/

# initialize command.
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
COPY ./docker/.aws /infra/.aws
COPY ./docker/init.sh /infra/init.sh
RUN chmod +x /infra/init.sh && /infra/init.sh
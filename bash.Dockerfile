# Base image
FROM ubuntu:latest

# Install developer packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    wget \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release\
    && rm -rf /var/lib/apt/lists/*

# Install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && apt-get install -y \
    docker-ce-cli

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install cmind

# Pull the CM repository
RUN cm pull repo mlcommons@ck

# Set the working directory in the container
WORKDIR /app

# Copy the script to the working directory
COPY script.sh .

# Set the entrypoint or CMD if needed
ENTRYPOINT ["./script.sh"]

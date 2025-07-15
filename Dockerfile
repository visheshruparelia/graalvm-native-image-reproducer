FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    build-essential \
    zlib1g-dev \
    gdb \
    && rm -rf /var/lib/apt/lists/*

# Install GraalVM Community Edition
RUN cd /tmp && wget https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-24.0.1/graalvm-community-jdk-24.0.1_linux-x64_bin.tar.gz \
    && tar -xzf graalvm-community-jdk-24.0.1_linux-x64_bin.tar.gz \
    && rm graalvm-community-jdk-24.0.1_linux-x64_bin.tar.gz

# Set environment variables
ENV JAVA_HOME=/tmp/graalvm-community-openjdk-24.0.1+9.1
ENV PATH=$JAVA_HOME/bin:$PATH

# Create app directory and copy App.java
RUN mkdir -p /app
COPY App.java /app/

# Set working directory
WORKDIR /app

# Default command
CMD ["/bin/bash"]
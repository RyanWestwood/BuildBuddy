FROM ubuntu:latest

# Install dependencies
RUN apt-get update && apt-get upgrade -y && useradd -m docker

RUN apt-get update && \
    apt-get install -y --fix-missing \
    curl \
    clang \
    build-essential \
    cmake \
    wget \
    unzip \
    git \
    ninja-build \
    ca-certificates \
    pkg-config \
    libfreetype6-dev \
    libfontconfig1-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libwebp-dev \
    libflac-dev \
    libogg-dev \
    libvorbis-dev \
    libmodplug-dev \
    libmpg123-dev \
    libopusfile-dev \
    libfluidsynth-dev \
    libsdl2-dev

RUN mkdir -p /home/docker/actions-runner && cd /home/docker/actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v2.303.0/actions-runner-linux-x64-2.303.0.tar.gz \
    && tar xzf ./actions-runner-linux-x64-2.303.0.tar.gz \
    && rm ./actions-runner-linux-x64-2.303.0.tar.gz

# install some additional dependencies
RUN chown -R docker ~docker && /home/docker/actions-runner/bin/installdependencies.sh

ADD scripts/start.sh scripts/start.sh
RUN chmod +x scripts/start.sh

COPY scripts/* scripts/
# Set the environment variables
ENV ACTIONS_RUNNER_HOOK_JOB_STARTED="/scripts/job-started.sh" \
    ACTIONS_RUNNER_HOOK_JOB_COMPLETED="/scripts/job-finished.sh"

USER docker
ENTRYPOINT ["scripts/start.sh"]
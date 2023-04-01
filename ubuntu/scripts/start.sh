#!/bin/bash
cd /home/docker/actions-runner
./config.sh --url url --pat token --unattended --replace --name Ubuntu --work _work --labels 'self-hosted','Ubuntu','X64'
./run.sh
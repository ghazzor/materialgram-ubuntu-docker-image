FROM debian:unstable

# Update and install required packages
RUN apt update && apt install python-is-python3 python3-venv wget openssl python3 python3-pip libgl1-mesa-dev libglib2.0-bin nano sudo figlet -y

# Install pip deps and setup venv
WORKDIR /home
RUN cat <<EOF >> pip.sh
#!/bin/bash
python -m venv .venv_docker
source .venv_docker/bin/activate
pip install python-telegram-bot opencv-python aiohttp
EOF

RUN bash pip.sh

# Set workdir to ~/py
RUN mkdir -p py
WORKDIR /home/py

FROM debian:unstable

# Update and install required packages
RUN apt update && apt install python-is-python3 python3-venv wget openssl python3 python3-pip libgl1-mesa-dev libglib2.0-bin nano sudo figlet -y

WORKDIR /home

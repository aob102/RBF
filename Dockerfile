#FROM continuumio/anaconda3

FROM ubuntu:18.04

RUN apt update -y && apt upgrade -y
RUN apt install -y gnupg2 unzip wget

RUN sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN apt update -y && apt install -y google-chrome-stable

RUN wget https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/bin/
ENV PATH="$PATH:/usr/bin/chromedriver"
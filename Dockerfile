FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip -y
RUN python3 -m pip install --u pip
RUN mkdir /app/
WORKDIR /app/
COPY . /app/
RUN pip3 install -U -r requirements.txt
CMD python3 main.py

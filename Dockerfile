FROM ubuntu:18.04

RUN apt-get update --fix-missing
RUN apt-get upgrade && apt-get autoremove
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y --fix-broken
RUN pip3 install pytest

ENV HOME /home
COPY moveToProduction.py /home/moveToProduction.py
STOPSIGNAL SIGTERM
WORKDIR /home

COPY requirements.txt /home/requirements.txt
RUN pip3 install -r requirements.txt

ENTRYPOINT ["python3"]


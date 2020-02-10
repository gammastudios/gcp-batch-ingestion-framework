FROM python:3

ADD parse.py /
ADD env-config.yaml /

RUN pip install pyyaml

CMD [ "python", "./parse.py" ]
FROM python:alpine3.10
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 6000
CMD python ./launch.py

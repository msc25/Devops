FROM python:alpine3.10
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 8008
CMD python ./kubernetes-hello-world.py

#COPY requirements.txt /app/requirements.txt
#ENTRYPOINT ["python", "./launch.py"]

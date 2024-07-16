FROM python:3.10-slim-buster
USER root
RUN mkdir /app
COPY . /app/
WORKDIR /app/
RUN pip3 install -r requirements.txt
ENV AIRFLOW_HOME='/app/airflow'
ENV AIRFLOW_CORE_DAGBAG_IMPORT_TIMEOUT=1000
ENV AIRFLOW_CORE_ENABLE_XCOM_PICKLING=True
RUN airflow db init
RUN airflow users create -e utkarshraj7217@gmail.com -f utkarsh -l raj -p admin -r Admin -u admin
RUN chmod 777 start.sh 

# Expose the web server port
EXPOSE 8080

RUN apt update -y
ENTRYPOINT ["/bin/sh"]
CMD ["start.sh"]


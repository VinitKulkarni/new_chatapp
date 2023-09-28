FROM python:3.6

MAINTAINER vinit

#install the below requirements for chat_app
RUN apt-get update
RUN apt-get install -y python3 python3-pip
RUN mkdir /new_chatapp

#git cloned reporsitory in chat_app move it to container
COPY . /new_chatapp

#requirement file present here
WORKDIR /new_chatapp
RUN pip3 install -r requirements.txt
RUN pip install mysqlclient
RUN pip3 install gunicorn
RUN apt-get install python3-dev default-libmysqlclient-dev build-essential

#port number
EXPOSE 8000

#manage.py file present here
WORKDIR /new_chatapp/fundoo
ENTRYPOINT python manage.py migrate && python3 manage.py runserver 0.0.0.0:8000

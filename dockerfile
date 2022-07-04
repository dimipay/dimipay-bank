FROM ubuntu:focal

COPY . /app
RUN apt-get update
RUN apt-get install python3.8 pip wget -y
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1
RUN apt-get install libfontconfig -y
RUN apt-get install libfreetype6 libfreetype6-dev -y
RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && cp ./phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN export OPENSSL_CONF=/etc/ssl
WORKDIR /app
CMD [ "python", "src/app.py"]
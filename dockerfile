FROM python:3.8

COPY . /app

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && tar -xjf phantomjs-2.1.1-linux-x86_64.tar.bz2 && cp ./phantomjs-2.1.1-linux-x86_64/bin/phantomjs /app/phanthomjs
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

WORKDIR /app

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
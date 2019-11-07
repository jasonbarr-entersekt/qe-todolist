FROM python:2

WORKDIR /src

COPY . .

RUN pip install -r requirements.txt
RUN wget http://chromedriver.storage.googleapis.com/2.46/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip -d /usr/local/bin
RUN export CHROME_BIN=chromium-browser

WORKDIR /src/robot/tests/
RUN pwd
RUN ls -al
RUN echo $PATH
CMD ["robot", "-d ../results", "-i ready", "bookingform.robot"]
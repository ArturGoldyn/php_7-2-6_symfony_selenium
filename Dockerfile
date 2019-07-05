FROM arturgoldyn/php_7-2-6_symfony
RUN mkdir -p /usr/share/man/man1 # workaround for error
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk-headless screen maven xvfb
RUN apt-get install -y chromium
RUN apt-get install -y firefox-esr
RUN apt-get install -y wget
RUN cd /root && wget https://chromedriver.storage.googleapis.com/73.0.3683.68/chromedriver_linux64.zip
RUN cd /root && unzip chromedriver_linux64.zip
RUN cp /root/chromedriver /bin/
RUN cd /root && wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
RUN cd /root && tar -zxvf geckodriver-v0.24.0-linux64.tar.gz
RUN cp /root/geckodriver /bin/
RUN rm -rfv /root/*
RUN chmod 755 /bin/chromedriver

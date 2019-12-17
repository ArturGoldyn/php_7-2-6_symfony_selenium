FROM arturgoldyn/php_7-2-6_symfony
RUN mkdir -p /usr/share/man/man1 # workaround for error
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk-headless screen maven xvfb
RUN apt-get install -y firefox-esr
RUN apt-get install -y wget
RUN cd /root && wget https://chromedriver.storage.googleapis.com/79.0.3945.36/chromedriver_linux64.zip
RUN cd /root && unzip chromedriver_linux64.zip
RUN cp /root/chromedriver /bin/
RUN cd /root && wget https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz
RUN cd /root && tar -zxvf geckodriver-v0.24.0-linux64.tar.gz
RUN cp /root/geckodriver /bin/
RUN cd /root && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get install -y fonts-liberation libappindicator3-1 lsb-release libxss1 xdg-utils
RUN cd /root && dpkg -i google-chrome-stable_current_amd64.deb
RUN rm -rfv /root/*
RUN chmod 755 /bin/chromedriver
RUN echo 'en_GB.UTF-8 UTF-8' >> /etc/locale.gen
RUN apt-get install -y locales
RUN dpkg-reconfigure --frontend=noninteractive locales
RUN locale-gen en_GB.UTF-8
RUN update-locale LANG=en_GB.utf8
RUN echo 'export LC_ALL=en_GB.UTF-8' >> /etc/profile
RUN echo 'export LANG=en_GB.UTF-8' >> /etc/profile
RUN echo 'export LANGUAGE=en_GB.UTF-8' >> /etc/profile

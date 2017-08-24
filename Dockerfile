FROM nimmis/apache-php5:latest

# File Author / Maintainer
MAINTAINER Sijin He ( sijin@ebi.ac.uk )

LABEL Description="App Library for the PhenoMeNal Portal"
LABEL software="PhenoMeNal Portal"
LABEL software.version="1.0.0-rc.3"
LABEL version="1.0"

ENV REVISION="5ecf07704d4cec3620dffc448aee6b5d960fd22a"

WORKDIR /var/www/html
RUN apt-get update && apt-get install -y git python python-dev build-essential python-pip && \
    git clone https://github.com/phnmnl/php-phenomenal-portal-app-library.git && \
    git -C php-phenomenal-portal-app-library checkout $REVISION && \
    pip install markdown2 && \
    apt-get purge -y python-dev build-essential python-pip && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /var/www/html/php-phenomenal-portal-app-library
RUN chmod 755 *
RUN chmod 644 bin
RUN chmod 644 conf
RUN chmod +x ./bin/run.sh
RUN echo "export BRANCH=master" > conf/branch.config
RUN (crontab -l 2>/dev/null; echo "*/20 * * * * /var/www/html/php-phenomenal-portal-app-library/bin/run.sh > /var/log/refresh.log 2> /var/log/refresh.error") | crontab -

EXPOSE 80

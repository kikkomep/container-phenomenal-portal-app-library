FROM nimmis/apache-php5:latest

# File Author / Maintainer
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL Description="App Library for the PhenoMeNal Portal"
LABEL software="PhenoMeNal Portal"
LABEL software.version="0.4.0"
LABEL version="1.2"

ENV REVISION="095e36259acbe28feffba048ddb7735ed57812a1"

WORKDIR /var/www/html
RUN apt-get update && apt-get install -y --no-install-recommends git python python-dev build-essential python-pip && \
    git clone https://github.com/phnmnl/php-phenomenal-portal-app-library.git && \
    git -C php-phenomenal-portal-app-library checkout $REVISION && \
    pip install markdown2 && \
    apt-get purge -y python-dev build-essential python-pip && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /var/www/html/php-phenomenal-portal-app-library

RUN chmod 755 * && chmod 644 bin && chmod 644 conf && chmod +x ./bin/run.sh \
    && echo "export BRANCH=master" > conf/branch.config \
    && (crontab -l 2>/dev/null; \
    { echo "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"; \
      echo "*/60 * * * * /var/www/html/php-phenomenal-portal-app-library/bin/run.sh > /var/log/refresh.log 2> /var/log/refresh.error"; }) | crontab -

EXPOSE 80

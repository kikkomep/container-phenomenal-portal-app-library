FROM nimmis/apache-php5:latest

# File Author / Maintainer
MAINTAINER Sijin He ( sijin@ebi.ac.uk )

LABEL Description="App Library for the PhenoMeNal Portal"
LABEL software="PhenoMeNal Portal"
LABEL software.version="1.0.0-rc.3"
LABEL version="0.3.2"

WORKDIR /var/www/html
RUN apt-get update && apt-get install -y git python python-dev build-essential python-pip

#Clone the project
RUN git clone https://github.com/phnmnl/php-phenomenal-portal-app-library.git
RUN pip install markdown2
WORKDIR /var/www/html/php-phenomenal-portal-app-library
RUN chmod 755 *
RUN chmod 644 bin
RUN chmod 644 conf
RUN chmod +x ./bin/run.sh
RUN ./bin/run.sh

EXPOSE 80
FROM java:8

MAINTAINER ramkuvel@gmail.com

ENV MULE_HOME /opt/mule

ENV MULE_VERSION 4.1.1

RUN set -x \
		&& cd /opt \
		&& curl -o mule.zip https://repository.mulesoft.org/nexus/content/repositories/releases/org/mule/distributions/mule-standalone
		&& unzip mule.zip \		
		&& mv mule-standalone-$MULE_VERSION mule\
		&& rm mule.zip
		
WORKDIR $MULE_HOME

VOLUME $MULE_HOME/opt
VOLUME $MULE_HOME/conf
VOLUME $MULE_HOME/domains
VOLUME $MULE_HOME/logs

ENTRYPOINT ["./bin/mule"]

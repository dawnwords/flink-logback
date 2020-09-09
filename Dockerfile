FROM flink:1.11.1-scala_2.12

ARG LOGBACK_VERSION=1.2.3
ARG SLF4J_VERSION=1.7.25

RUN rm /opt/flink/conf/log4j* && \
	rm /opt/flink/lib/log4j* && \
	wget --quiet https://repo1.maven.org/maven2/ch/qos/logback/logback-classic/${LOGBACK_VERSION}/logback-classic-${LOGBACK_VERSION}.jar -O /opt/flink/lib/logback-classic-${LOGBACK_VERSION}.jar && \
	wget --quiet https://repo1.maven.org/maven2/ch/qos/logback/logback-core/${LOGBACK_VERSION}/logback-core-${LOGBACK_VERSION}.jar -O /opt/flink/lib/logback-core-${LOGBACK_VERSION}.jar && \
	wget --quiet https://repo1.maven.org/maven2/org/slf4j/log4j-over-slf4j/${SLF4J_VERSION}/log4j-over-slf4j-${SLF4J_VERSION}.jar -O /opt/flink/lib/log4j-over-slf4j-${SLF4J_VERSION}.jar

ADD logback.xml /opt/flink/conf/logback-console.xml	

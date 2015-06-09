FROM akihirosuda/zookeeper-dynamic
MAINTAINER akihirosuda

ADD log4j.properties /zk/conf/
# docker-enter fails if space in env var
ENV ZOO_LOG4J_PROP DEBUG,CONSOLE,SYSLOG
RUN apt-get update && apt-get install -y telnet netcat less lv


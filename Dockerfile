FROM logstash:2.3.4

ENV GEM_URL     https://cwatch-logs-gem.s3.amazonaws.com/logstash-output-cloudwatchlogs-2.0.0.pre1.gem
ENV GEM_SHASUM 32175faa067faa91010486a44ef87c0f349a6f50761ab8ce4564a59ab778ee1c

RUN apt-get update -qq && apt-get install -qqy git && rm -rf /var/cache/apt
RUN curl -Lo /tmp/logstash-output-cloudwatchlogs.gem $GEM_URL
RUN echo "$GEM_SHASUM  /tmp/logstash-output-cloudwatchlogs.gem" | shasum -a 256 -c

WORKDIR /opt/logstash
RUN     bin/logstash-plugin install /tmp/logstash-output-cloudwatchlogs.gem
WORKDIR /

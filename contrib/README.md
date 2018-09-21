# Additional Components for Using log-liner

## Sample Configuration for Logstash

   file: sample_conf_for_logstash

   Drop this file into "/etc/logstash/conf.d" and rename to "log-liner.conf".

   cp contrib/sample_conf_for_logstash /etc/logstash/conf.d/log-liner.conf

   Then issue "systemctl restart logstash.service" for logstash to process this new configuration.


## Sample Configuration for logrotate

   file: sample_conf_for_logrotate

   Drop this file into "/etc/logrotate.d/" and rename to "log-liner".

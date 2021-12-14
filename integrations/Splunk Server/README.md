Splunk Server
===========

Splunk Server is an integration to run a Splunk (8.2.1) on a XSOAR.


Installing
----------

1. Upload Splunk_Server.yml onto your integration screen on your XSOAR.

2. Make sure that `Splunk Server` is shown on the list of your integrations.


How to configure an instance
----------

#### 0. Go to ABOUT > Troubleshooting > Server Configuration

  Set  `instance.execute.external` = true
  
  If you failed to run the container due to the out of memory, please do this setting.<br>
  Set  `limit.docker.memory` = false<br>
  And run `/reset_containers` in the CLI to take effect.

  Set  `limit.docker.cpu` = false<br>
  And run `/reset_containers` in the CLI to take effect if the CPU limit is applied for the docker.


#### 1. Create a Splunk server instance

  Add instance with the parameters below:
   - Instance Name: splunk
   - Listen Port: 8089
   - Splunk Admin Password: Password123$

  You can access the Splunk UI at
   - https://xsoar-server/instance/execute/splunk/
   - http://xsoar-server:8089/
    
      ```
      username: admin
      password: Password123$
      ```
      
  Also, the REST API is available at
   - http://xsoar-server:8089/
   - https://your-gateway-ip;:8089/<br>
      e.g. https://172.17.0.1:8089/

  
#### 2. Get the gateway address of the docker bridge network

  Run `!splunkd-get-gateways` in your CLI to get your gateway IP which is used for the REST API


Ingest a syslog message
----------

#### Send a syslog message with socat
```
echo '<0> host 1637507985.865 logformat=splunk_recommended_squid duration=74 src_ip=192.168.1.43 src_port=61745 dest_ip=117.18.237.29 dest_port=80 user_ident="-" user="-" local_time=[21/Nov/2021:15:19:45 +0000] http_method=GET request_method_from_client=GET request_method_to_server=GET url="http://ocsp.digicert.com/MFEwTzBNMEswSTAJBgUrDgMCGgUABBQ50otx%2Fh0Ztl%2Bz8SiPI7wEWVxDlQQUTiJUIBiV5uNu5g%2F6%2BrkS7QYXjzkCEAxq6XzO1ZmDhpCgCp6lMhQ%3D" http_referrer="-" http_user_agent="Microsoft-CryptoAPI/10.0" status=200 vendor_action=TCP_MISS dest_status=HIER_DIRECT total_time_milliseconds=52 http_content_type="application/ocsp-response" bytes=1172 bytes_in=270 bytes_out=902 sni="-"' | socat tcp-connect:xsoar-server:8089 stdin
```

#### Send a syslog message with Syalog Sender
```
!syslog-send address=172.17.0.1 port=8089 protocol=TCP message=`<0> host 1637507985.865 logformat=splunk_recommended_squid duration=74 src_ip=192.168.1.43 src_port=61745 dest_ip=117.18.237.29 dest_port=80 user_ident="-" user="-" local_time=[21/Nov/2021:15:19:45 +0000] http_method=GET request_method_from_client=GET request_method_to_server=GET url="http://ocsp.digicert.com/MFEwTzBNMEswSTAJBgUrDgMCGgUABBQ50otx%2Fh0Ztl%2Bz8SiPI7wEWVxDlQQUTiJUIBiV5uNu5g%2F6%2BrkS7QYXjzkCEAxq6XzO1ZmDhpCgCp6lMhQ%3D" http_referrer="-" http_user_agent="Microsoft-CryptoAPI/10.0" status=200 vendor_action=TCP_MISS dest_status=HIER_DIRECT total_time_milliseconds=52 http_content_type="application/ocsp-response" bytes=1172 bytes_in=270 bytes_out=902 sni="-"`
````

----------
### NOTE:
 - Data and configurations are gone whenever restarting the docker container.

Splunk Server
===========

Splunk Server is an integration to run a Splunk on a XSOAR.


Installing
----------

1. Upload Splunk_Server.yml onto your integration screen on your XSOAR.

2. Make sure that `Splunk Server` is shown on the list of your integrations.


How to configure an instance
----------

#### 0. Go to ABOUT > Troubleshooting > Server Configuration

  Set  instance.execute.external = true
  
  If you failed to run the container due to the out of memory, please do this setting.
  Set  limit.docker.memory = false


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

----------
### NOTE:
 - Data and configurations are gone whenever restarting the docker container.

admock
===========
admock is a Active Directory mock server run on a XSOAR.

Installing
----------

1. Upload admock.yml onto your integration screen on your XSOAR.

2. Make sure that `admock` is shown on the list of your integrations.


How to configure an instance
----------

### How to configure an instance.

#### 1. Create an instance
Add instance with the parameters below:
  - Instance Name: admock
  - Long running instance: Yes
  - Port: 636
  - LDIF URL: <An URL your LDIF file located at>
              Sample LDIF file: https://github.com/spearmin10/test/blob/master/admock-ldif.zip?raw=true (Temporary)
  - Run as LDAPS server: Yes

Keep the default value in other parameters.


#### 2. Make sure the IP address on which the server is running
Run
```bash
!admock-get-gateways
```
in CLI, in order to get the gateway IP on which the admock is running.

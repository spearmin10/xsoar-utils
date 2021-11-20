TSRAIN Mail Server
===========

TSRAIN Mail Server is an integration to run a mail system (IMAP server, POP3 server, SMTP server as well as Web Mail UI) on a XSOAR.


Installing
----------

1. Upload TSRAIN_mail_server.yml onto your integration screen on your XSOAR.

2. Make sure that `TSRAIN mail server` is shown on the list of your integrations.


How to configure instances
----------

#### 0.  Go to ABOUT > Troubleshooting > Server Configuration
  Set  instance.execute.external = true


#### 1. Create an email server instance
  Add instance with the parameters below:
   - Instance Name: tsrain
   - Listen Port: 8888
   - Service Type: Select 'mail server'

  You can access the webmail UI at
   - https://xsoar-server/instance/execute/tsrain/
   - http://xsoar-server:8888/
    
      ```
      username: any email address (e.g. test@test.lan)
      password: Password123$
      ```

   [Admin UI]
   - https://xsoar-server/instance/execute/tsrain/?admin
   - http://xsoar-server:8888/?admin
 
      ```
       username: admin
       password: <Run !tsr-get-default-admin-password>
      ```

#### 2. Check the gateway address of the docker bridge network

  Run `!tsr-get-gateways` in CLI,
  and memorize the gateway IP for 3.1 and 4.1


#### 3. Create a SMTP adapter for 'Mail Sender (New)'
 Add instance with the parameters below:
  - Listen Port: 8025
  - Service Type: Select 'smtp adapter'

##### 3.1. Configure 'Mail Sender (New)' to connect to the SMTP adapter.
 Add instance with the parameters below:
  - Mail server hostname or IP address: <gateway IP>
  - SMTP Port: 8025  (Specify the SMTP adapter port)
  - Sender address: any email address


#### 4. Create a IMAP adapter for 'Mail Listener'
 Add instance with the parameters below:
  - Listen Port: 8143
  - Service Type: Select 'imap4 adapter'

##### 4.1. Configure 'Mail Listener' to connect to the IMAP4 adapter.
 Add instance with the parameters below:
  - Mail server hostname or IP address: <gateway IP>
  - IMAP Port: 8143 (Specify the IMAP4 adapter port)
   - Credentials: your email address
   - Password: Password123$

NOTE:
 - Emails are stored in memory. All the emails are gone whenever restarting the docker container.
  

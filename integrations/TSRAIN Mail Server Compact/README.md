TSRAIN Mail Server Compact
===========

TSRAIN Mail Server Compact is an integration to run a mail system (IMAP server, SMTP server as well as Web Mail UI) on a XSOAR.


Installing
----------

1. Upload TSRAIN_mail_server_compact.yml onto your integration screen on your XSOAR.

2. Make sure that `TSRAIN mail server Compact` is shown on the list of your integrations.


How to configure an instance
----------

#### 0.  Go to ABOUT > Troubleshooting > Server Configuration
  Set  instance.execute.external = true

#### 1. Create an instance
Add instance with the parameters below:
  - Instance Name: tsrain
  - Listen Port: 8888

You can access the webmail UI at
  - https://xsoar-server/instance/execute/tsrain/
  - http://xsoar-server:8888/
    ```
      username: any email address (e.g. test@test.lan)
      password: Password123$
    ```

Admin UI
  - https://xsoar-server/instance/execute/tsrain/?admin
  - http://xsoar-server:8888/?admin
    ```
       username: admin
       password: <Run !tsrc-get-default-admin-password>
    ```

#### 2. Get the gateway address of the docker bridge network
Run !tsrc-get-gateways in CLI, and memorize the gateway IP for 3 and 4

#### 3. (Optional) Configure 'Mail Sender (New)' to connect to the server.
Add an instance with the parameters below:
  - Mail server hostname or IP address: <gateway IP>
  - SMTP Port: 8888
  - Sender address: any email address

#### 4. (Optional) Configure 'Mail Listener v2' to connect to the server.
Add an instance with the parameters below:
  - Mail server hostname or IP address: <gateway IP>
   - IMAP Port: 8888
   - Username: your email address
   - Password: Password123$
   - Incoming mail folder: INBOX
   - Use TLS for connection: Yes
   - Trust any certificate (not secure): Yes

### NOTE:
 - Emails are stored in memory. All the emails are gone whenever restarting the docker container.

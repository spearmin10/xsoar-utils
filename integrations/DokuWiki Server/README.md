DokuWiki Server
===========

DokuWiki Server is an integration to run a DokuWiki server on a XSOAR.


Installing
----------

1. Upload DokuWiki_Server.yml onto your integration screen on your XSOAR.

2. Make sure that `DokuWiki Server` is shown on the list of your integrations.


How to configure an instance
----------

### How to configure an instance.

#### 0.  Go to ABOUT > Troubleshooting > Server Configuration
  Set  instance.execute.external = true

#### 1. Create an instance
Add instance with the parameters below:
  - Instance Name: dokuwiki
  - Listen Port: 8280

You can access the webmail UI at
  - https://xsoar-server/instance/execute/dokuwiki/
  - http://xsoar-server:8280/

Installer UI
  - https://xsoar-server/instance/execute/dokuwiki/install.php
  - http://xsoar-server:8118/install.php

Restore from backup
  - https://xsoar-server/instance/execute/dokuwiki/restore.php
  - http://xsoar-server:8118/restore.php

### NOTE:
 - All the contents are gone whenever restarting the docker container because those are stored in memory.

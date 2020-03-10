Sentry monitoring role
=========

This role installs monitoring agent and enable the status information handlers in Nginx and memcached. The role also adds the keys of the required IAM user.

Example Playbook
----------------

    - hosts: servers
      become: true
      gather_facts: no
      roles:
         - { role: sentry_monitoring_role }

License
-------

BSD

Author Information
------------------

https://www.sxvova.opensource-ukraine.org/ and Nikita Makarov

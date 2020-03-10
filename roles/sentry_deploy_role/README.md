Sentry deploy role
=========

This role installs Sentry and creates superuser.

Requirements
------------

Installed docker and docker-compose.

Role Variables
--------------
| Variable                      | Description                                        |
|-------------------------------|----------------------------------------------------|
| `ansible_user`                | Your Ansible user name.                            |
| `ansible_ssh_private_key_file`| Path to ssh private key.                           |
| `registry_url `               | Link to registry with docker image.                |
| `registry_admin `             | Registry admin name.                               |
| `project_name `               | Name of required project.                          |
| `commit_sha`                  | The version of the image that is tracked by commit.|
| `sentry_user_email`           | Sentry **super user** name.                        |
| `sentry_user_password`        | Sentry **super user** password.                    |

Example Playbook
----------------

    - hosts: servers
      become: true
      gather_facts: no
      roles:
         - { role: sentry_deploy_role }

License
-------

GNU General Public License v3.0

Author Information
------------------

https://www.sxvova.opensource-ukraine.org/

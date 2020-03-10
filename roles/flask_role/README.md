Flask role 
=========

This role allows you to raise a container with a flask application.

Requirements
------------

Installed docker and docker-compose

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

Example Playbook
----------------

    - hosts: flask
      become: true
      gather_facts: no
      roles:
         - { role: flask_role }

License
-------

GNU General Public License v3.0

Author Information
------------------

https://www.sxvova.opensource-ukraine.org/

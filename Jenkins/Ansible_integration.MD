# Ansible integration with Jenkins
### Part-01 Integration Setps

Install "publish Over SSH"
 - `Manage Jenkins` > `Manage Plugins` > `Available` > `Publish over SSH` 

Enable connection between Ansible and Jenkins
- `Manage Jenkins` > `Configure System` > `Publish Over SSH` > `SSH Servers` 

	- SSH Servers:
		- Hostname:`<ServerIP>`
		- username: `ansadm`
		- password: `*******`

Test the connection "Test Connection"

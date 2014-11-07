## itamae-recipes

- 個人用です。

### 初期設定

```
setenforce 0
mkdir /root/.ssh
chmod 700 /root/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQClVm7p5ckjmscB4gfJrI9O9Pa7Wo/7VEVkkgACZut7xBDK7dpD2wsavCUe9s2Ll4jFDc4UjsvypgPYhAGu3k9tGb8v7ysPHC2ZMh1zCdqrvuNMl+w3EnoEJW9iY5/NgCT807TqW890CUww3rHAYyyB0msmN62UgHdELFQHWAa7wNcQeTPUG0r8FaxwTYiMAtKoHz9YQMQJdDrTd6UmOSBWx0SEyBk0RL5v9kWzz4hIsQV80psDcDoSxrj37fSkG3oZDu7sG2owjAaxG5bKgQ3g9e953LnGEiI8ywHVeerL/A1cZTWcoM91aqyiT3goLF7dQFzXzL3iw3OQN/BL3ExN" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
```

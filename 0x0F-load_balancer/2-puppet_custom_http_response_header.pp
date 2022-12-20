#  automate the task of creating a custom HTTP header response, but with Puppet.

exec { 'update_packages':
	command => 'sudo apt-get -y update',
	provider => 'shell',
}

exec { 'install_nginx':
	command => 'sudo apt-get -y install nginx',
	provider => 'shell',
}

exec { 'start_nginx':
	command => 'sudo service nginx start',
	provider => 'shell',
}

exec { 'modify_nginx_config':
	command => 'sed -i  "11i\\\tadd_header X-Served-By $HOSTNAME;" /etc/nginx/nginx.conf && sudo service nginx restart',
	provider => 'shell',
}

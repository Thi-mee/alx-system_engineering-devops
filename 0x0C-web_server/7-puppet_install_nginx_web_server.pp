# using puppet, install nginx and configure it to serve a page with the content "hello world"
# redirect using "301 removed permanently"

package { 'nginx':
  ensure => 'installed',
}

file { '/usr/share/nginx/html/index.html':
  ensure  => 'file',
  content => 'hello world',
}

file { '/etc/nginx/sites-available/default':
  ensure => 'file',
  content => 'server {
    listen 80;
    listen [::]:80 default_server;
    root   /etc/nginx/html;
    index  index.html index.htm;
    location /redirect_me {
        return 301 http://github.com/;
    }
  }'
}


service { 'nginx':
  ensure => 'running',
  enable => true,
}

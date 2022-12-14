# using puppet, install nginx and configure it to serve a page with the content "hello world"
# redirect using "301 removed permanently"

package { 'nginx':
  ensure => 'installed',
}

file { '/usr/share/nginx/html/index.html':
  ensure  => 'file',
  content => 'hello world',
}


file { '/etc/nginx/conf.d/redirect.conf':
  ensure  => 'file',
  content => 'server {
    listen 80/redirect_me;
    server_name github.com;
    return 301 http://www.github.com/thi-mee;
  }',
}

service { 'nginx':
  ensure => 'running',
  enable => true,
}

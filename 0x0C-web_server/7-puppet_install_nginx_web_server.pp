# using puppet, install nginx and configure it to serve a page with the content "hello world"

package { 'nginx':
  ensure => 'installed',
}

file { '/usr/share/nginx/html/index.html':
  ensure  => 'file',
  content => 'hello world',
}

service { 'nginx':
  ensure => 'running',
  enable => true,
}


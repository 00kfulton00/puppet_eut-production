class wcache {
  class { 'varnish':
}
  ::varnish::vcl { '/etc/varnish/default.vcl':
  content => template("${module_name}/default.vcl.erb"),
  }
}

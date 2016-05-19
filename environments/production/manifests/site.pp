# Explictly set to avoid warning message
Package {
  allow_virtual => false,
}

class { 'boundary':
    token => $api_token,
}


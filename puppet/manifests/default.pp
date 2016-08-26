node default {
  class { 'docker': }
  class { 'docker::compose': }
  class { 'awscli': }
  class { 'git': }
  class { 'screen': }
  class { 'vim': }

  class { 'nodejs':
    version => 'stable'
  }

  package { 'bundler':
    ensure   => present,
    provider => gem
  }

  # This allows us to use docker without sudoing.
  user { 'vagrant':
    ensure         => present,
    groups         => ['docker'],
    key_membership => 'minimum',
    require        => Class['docker']
  }

  ssh_keygen { 'vagrant':
    comment => 'vagrant@devbox',
    bits    => '4096'
  }

  class { 'ohmyzsh': } ->
  ohmyzsh::install { ['root', 'vagrant']: } ->
  ohmyzsh::plugins {
    ['root', 'vagrant']:
      plugins => 'aws bundler docker gem gitfast npm pip screen'
  } ->
  # I really like Honukai, okay?
  ohmyzsh::theme {
    ['root', 'vagrant']:
      theme => 'honukai'
  } ->
  remote_file {
    '/home/vagrant/.oh-my-zsh/themes/honukai.zsh-theme':
      ensure => present,
      source => 'https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm-zsh/master/honukai.zsh-theme',
      owner  => 'vagrant',
      group  => 'vagrant';
    '/root/.oh-my-zsh/themes/honukai.zsh-theme':
      ensure => present,
      source => 'https://raw.githubusercontent.com/oskarkrawczyk/honukai-iterm-zsh/master/honukai.zsh-theme',
      owner  => 'root',
      group  => 'root';
  }
}

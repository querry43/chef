package 'apt-transport-https'

packages = [
  'apt-file',
  'finger',
  'gcc',
  'git',
  'letsencrypt',
  'lxc',
  'ntp',
  'openssh-server',
  'supervisor',
  'vim-nox',
  'vim-scripts',
]

package packages

gem_package 'config_curator'
gem_package 'ruby-shadow'

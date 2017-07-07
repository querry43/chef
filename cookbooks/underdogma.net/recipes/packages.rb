package 'apt-transport-https'

apt_repository 'googleapis' do
  uri          'https://storage.googleapis.com/download.dartlang.org/linux/debian'
  distribution 'stable'
  key          'https://dl-ssl.google.com/linux/linux_signing_key.pub'
  components   ['main']
  trusted      true
end

packages = [
  'apt-file',
  'dart',
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

execute 'install letsencrypt.sh' do
  command 'curl -L https://raw.githubusercontent.com/lukas2511/letsencrypt.sh/master/letsencrypt.sh > /usr/local/bin/letsencrypt.sh; chmod +x /usr/local/bin/letsencrypt.sh'
  creates '/usr/local/bin/letsencrypt.sh'
end

directory '/usr/local/etc/letsencrypt.sh' do
  action :create
  recursive true
end

directory '/var/www/letsencrypt' do
  action    :create
  recursive true
end

cookbook_file '/usr/local/etc/letsencrypt.sh/config' do
  action :create
  source 'letsencrypt.sh'
  mode   '0644'
end

cookbook_file '/usr/local/etc/letsencrypt.sh/domains.txt' do
  action :create
  source 'domains.txt'
  mode   '0644'
end

cron 'letsencrypt_cron' do
  day     '1'
  hour    '0'
  minute  '0'
  command '/usr/local/bin/letsencrypt.sh -c'
  mailto  'matt@underdogma.net'
end

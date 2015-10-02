directory '/var/www' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

git '/var/www/underdogmadotnet' do
  repository 'https://github.com/querry43/underdogmadotnet.git'
end

supervisord_program 'nginx_proxy' do
  autostart true
  autorestart true
  command 'docker run --name nginx-proxy -a stdout -a stderr --rm=true -p 80:80 -v /home/matt/chef/cookbooks/underdogma.net/files/nginx/proxy.conf:/etc/nginx/conf.d/default.conf:ro --link nginx-www-underdogma-net:nginx-www-underdogma-net --link slicerserver:slicerserver nginx'
end

supervisord_program 'nginx_www_underdogma_net' do
  autostart true
  autorestart true
  command 'docker run --name nginx-www-underdogma-net -a stdout -a stderr --rm=true -v /var/www/underdogmadotnet/build/web:/usr/share/nginx/html:ro nginx'
  notifies :run, 'execute[make underdogmadotnet]'
end

execute 'make underdogmadotnet' do
  command '/usr/bin/make'
  cwd '/var/www/underdogmadotnet'
  action :nothing
end

supervisord_program 'slicerserver' do
  autostart true
  autorestart true
  command 'docker run --name slicerserver -a stdout -a stderr --rm=true slicerserver'
end

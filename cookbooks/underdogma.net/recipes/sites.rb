supervisord_program 'underdogmadotnet' do
  autostart true
  autorestart true
  command 'docker-proxy.sh underdogmadotnet qrry/underdogmadotnet -e VIRTUAL_HOST=www.underdogma.net'
end

git '/var/www/3d-printer' do
  repository 'https://github.com/querry43/3d-printer.git'
end

supervisord_program 'slicerserver' do
  autostart true
  autorestart true
  command 'docker-proxy.sh slicerserver qrry/slicerserver -e VIRTUAL_HOST=slicer.underdogma.net -e PROXY_PORT=5000 -v /var/www/3d-printer/configuration:/home/matt/work/3d-printer/configuration:ro'
end

supervisord_program 'dynamic-proxy' do
  autostart true
  autorestart true
  command 'docker-proxy.sh dynamic-proxy qrry/underdogma-dynamic-proxy -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock:ro -v /home/matt/public_html:/home/matt/public_html:ro -v /etc/letsencrypt:/etc/letsencrypt'
end

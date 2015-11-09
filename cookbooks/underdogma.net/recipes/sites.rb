supervisord_program 'dynamic-proxy' do
  autostart true
  autorestart true
  command 'docker-proxy.sh dynamic-proxy qrry/underdogma-dynamic-proxy -a stdout -a stderr --rm=true -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock:ro'
end

supervisord_program 'underdogmadotnet' do
  autostart true
  autorestart true
  command 'docker-proxy.sh underdogmadotnet qrry/underdogmadotnet -a stdout -a stderr --rm=true -e VIRTUAL_HOST=www.underdogma.net'
end

supervisord_program 'slicerserver' do
  autostart true
  autorestart true
  command 'docker-proxy.sh slicerserver qrry/slicerserver -a stdout -a stderr --rm=true -e VIRTUAL_HOST=slicer.underdogma.net -e PROXY_PORT=5000 -v /home/matt/3d-printer/configuration:/home/matt/work/3d-printer/configuration:ro'
end

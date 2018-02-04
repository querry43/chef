supervisord_program 'underdogmadotnet' do
  autostart true
  autorestart true
  command 'docker-proxy.sh underdogmadotnet qrry/underdogmadotnet -e VIRTUAL_HOST=www.underdogma.net'
end

supervisord_program 'dynamic-proxy' do
  autostart true
  autorestart true
  command 'docker-proxy.sh dynamic-proxy qrry/underdogma-dynamic-proxy -p 80:80 -p 443:443 -v /var/run/docker.sock:/var/run/docker.sock:ro -v /home/matt/public_html:/home/matt/public_html:ro -v /etc/letsencrypt:/etc/letsencrypt'
end

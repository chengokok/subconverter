{% if request.target == "clash" or request.target == "clashr" %}
mode: rule
port: {{ default(global.clash.http_port, "7890") }}
socks-port: {{ default(global.clash.socks_port, "7891") }}
redir-port: {{ default(global.clash.redir_port, "7892") }}
allow-lan: {{ default(global.clash.allow_lan, "true") }}
log-level: {{ default(global.clash.log_level, "error") }}
external-controller:9090

{% if default(request.clash.tun-set, "0") == "1" %}
tun:
  enable: true
  auto-detect-interface: false
  auto-route: false
  dns-hijack:
  - any:53
  stack: gvisor
  strict-route: false
profile:
  store-selected: true
  store-fake-ip: true
{% else %}
{% endif %}

{% if request.target == "clash" or request.target == "clashr" %}
dns:
  enable: true
  direct-nameserver-follow-policy: false
  listen:7874
  prefer-h3: false
  respect-rules: false
  use-hosts: true
  use-system-hosts: true
  nameserver:
    - 211.137.64.163
    - 114.114.114.114
    - tls://1.0.0.1:853
    - tls://8.8.8.8:853
  fallback:
    - tls://dns.google:853
    - https://1.12.12.12/dns-query
  default-nameserver:
    - 211.137.64.163
    - 114.114.114.114
  ipv6: false
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  fake-ip-filter:
    - "*.lan"
    - "*.localdomain"
    - "*.example"
    - "*.invalid"
    - "*.localhost"
    - "*.test"
    - "*.local"
    - "*.home.arpa"
    - time.*.com
    - time.*.gov
    - time.*.edu.cn
    - time.*.apple.com
    - time1.*.com
    - time2.*.com
    - time3.*.com
    - time4.*.com
    - time5.*.com
    - time6.*.com
    - time7.*.com
    - ntp.*.com
    - ntp1.*.com
    - ntp2.*.com
    - ntp3.*.com
    - ntp4.*.com
    - ntp5.*.com
    - ntp6.*.com
    - ntp7.*.com
    - "*.time.edu.cn"
    - "*.ntp.org.cn"
    - "+.pool.ntp.org"
    - time1.cloud.tencent.com
    - music.163.com
    - "*.music.163.com"
    - "*.126.net"
    - musicapi.taihe.com
    - music.taihe.com
    - songsearch.kugou.com
    - trackercdn.kugou.com
    - "*.kuwo.cn"
    - api-jooxtt.sanook.com
    - api.joox.com
    - joox.com
    - y.qq.com
    - "*.y.qq.com"
    - streamoc.music.tc.qq.com
    - mobileoc.music.tc.qq.com
    - isure.stream.qqmusic.qq.com
    - dl.stream.qqmusic.qq.com
    - aqqmusic.tc.qq.com
    - amobile.music.tc.qq.com
    - "*.xiami.com"
    - "*.music.migu.cn"
    - music.migu.cn
    - "+.msftconnecttest.com"
    - "+.msftncsi.com"
    - msftconnecttest.com
    - msftncsi.com
    - localhost.ptlogin2.qq.com
    - localhost.sec.qq.com
    - "+.srv.nintendo.net"
    - "*.n.n.srv.nintendo.net"
    - "+.stun.playstation.net"
    - xbox.*.*.microsoft.com
    - "*.*.xboxlive.com"
    - xbox.*.microsoft.com
    - xnotify.xboxlive.com
    - "+.battlenet.com.cn"
    - "+.wotgame.cn"
    - "+.wggames.cn"
    - "+.wowsgame.cn"
    - "+.wargaming.net"
    - proxy.golang.org
    - stun.*.*
    - stun.*.*.*
    - "+.stun.*.*"
    - "+.stun.*.*.*"
    - "+.stun.*.*.*.*"
    - "+.stun.*.*.*.*.*"
    - heartbeat.belkin.com
    - "*.linksys.com"
    - "*.linksyssmartwifi.com"
    - "*.router.asus.com"
    - mesu.apple.com
    - swscan.apple.com
    - swquery.apple.com
    - swdownload.apple.com
    - swcdn.apple.com
    - swdist.apple.com
    - lens.l.google.com
    - stun.l.google.com
    - "+.nflxvideo.net"
    - "*.square-enix.com"
    - "*.finalfantasyxiv.com"
    - "*.ffxiv.com"
    - "*.ff14.sdo.com"
    - ff.dorado.sdo.com
    - "*.mcdn.bilivideo.cn"
    - "+.media.dssott.com"
    - shark007.net
{% endif %}

{% endif %}

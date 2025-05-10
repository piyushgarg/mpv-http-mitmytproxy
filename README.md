# mpv-http-mitmytproxy

The script will automatically setup the mpv to inject mitmproxy.


## Installation / Setup

```
git clone git@github.com:piyushgarg/mpv-http-mitmytproxy.git
cd mpv-http-mitmytproxy
mkdir -p ~/.config/mpv/scripts/proxy
cp -fv mitmplugin.py main.lua ~/.config/mpv/scripts/proxy
```

### Update the path for mitmdump
Edit and update the actual path for mitmdump in ~/.config/mpv/scripts/proxy/main.lua


### credits / source
[mpv-http-ytproxy](https://github.com/spvkgn/mpv-http-ytproxy)

[gist](https://gist.github.com/ftk/253347b2c9a53bbd6087f086970106b6)

[toomyzoom](https://github.com/toomyzoom)
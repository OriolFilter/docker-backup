vde_switch -d -s /tmp/meuSWtest -M /tmp/meuSWtest.mngmt
dpipe vde_plug -p 1 /tmp/meuSWtest = nc -u jo.lan 9000

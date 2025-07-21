1. Выставить права
```
sudo chmod +x /usr/local/bin/test-monitor.sh
```
2. Запустить процессы
```
sudo systemctl daemon-reload
sudo systemctl enable --now test-monitor.timer
```

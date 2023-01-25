1. На лекции мы познакомились с node_exporter. В демонстрации его исполняемый файл запускался в background. Этого достаточно для демо, но не для настоящей production-системы, где процессы должны находиться под внешним управлением. Используя знания из лекции по systemd, создайте самостоятельно простой unit-файл для node_exporter:

	* поместите его в автозагрузку,
	* предусмотрите возможность добавления опций к запускаемому процессу через внешний файл (посмотрите, например, на systemctl cat cron),
	* удостоверьтесь, что с помощью systemctl процесс корректно стартует, завершается, а после перезагрузки автоматически поднимается.
	
		* Решение:
			- wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
			- tar zxvf node_exporter-1.5.0.linux-amd64.tar.gz
			- cd node_exporter-1.5.0.linux-amd64.tar.gz
			- sudo cp node_exporter /usr/local/bin/
			- sudo nano /etc/systemd/system/node_exporter.service
			
					[Unit]
					Description=Node Exporter
					After=network.target
					 
					[Service]
					Type=simple
					ExecStart=/usr/local/bin/node_exporter $EXTRA_OPTS
					 
					[Install]
					WantedBy=multi-user.target
				
				- sudo systemctl daemon-reload
				- sudo systemctl start node_exporter
				- sudo systemctl enable node_exporter
				- Внешний файл:  echo "EXTRA_OPTS=\"--log.level=info\"" | sudo tee /opt/node_exporter.env
				- Проверка: systemctl status node_exporter
				
						● node_exporter.service - Node Exporter
						     Loaded: loaded (/etc/systemd/system/node_exporter.service; enabled; vendor preset: enabled)
						     Active: active (running) since Wed 2023-01-25 21:09:05 UTC; 3s ago
						   Main PID: 1784 (node_exporter)
						      Tasks: 4 (limit: 1065)
						     Memory: 3.0M
						     CGroup: /system.slice/node_exporter.service
						             └─1784 /usr/local/bin/node_exporter
						
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=thermal_zone
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=time
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=timex
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=udp_queues
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=uname
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=vmstat
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=xfs
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.442Z caller=node_exporter.go:117 level=info collector=zfs
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.443Z caller=tls_config.go:232 level=info msg="Listening on" address=[::]:9100
						Jan 25 21:09:05 vagrant node_exporter[1784]: ts=2023-01-25T21:09:05.443Z caller=tls_config.go:235 level=info msg="TLS is disabled." http2=false address=[::]:9100

2. Ознакомьтесь с опциями node_exporter и выводом /metrics по-умолчанию. Приведите несколько опций, которые вы бы выбрали для базового мониторинга хоста по CPU, памяти, диску и сети.

	* Решение: 
	* CPU: 
	
			# TYPE node_cpu_seconds_total counter
			node_cpu_seconds_total{cpu="0",mode="idle"} 3307.79
			node_cpu_seconds_total{cpu="0",mode="iowait"} 0.95
			node_cpu_seconds_total{cpu="0",mode="irq"} 0
			node_cpu_seconds_total{cpu="0",mode="nice"} 0
			node_cpu_seconds_total{cpu="0",mode="softirq"} 0.98
			node_cpu_seconds_total{cpu="0",mode="steal"} 0
			node_cpu_seconds_total{cpu="0",mode="system"} 21.34
			node_cpu_seconds_total{cpu="0",mode="user"} 11.73
			node_cpu_seconds_total{cpu="1",mode="idle"} 3296.03
			node_cpu_seconds_total{cpu="1",mode="iowait"} 0.68
			node_cpu_seconds_total{cpu="1",mode="irq"} 0
			node_cpu_seconds_total{cpu="1",mode="nice"} 0
			node_cpu_seconds_total{cpu="1",mode="softirq"} 2.36
			node_cpu_seconds_total{cpu="1",mode="steal"} 0
			node_cpu_seconds_total{cpu="1",mode="system"} 19.45
			node_cpu_seconds_total{cpu="1",mode="user"} 9.2
		
	* RAM:
	
			TYPE node_memory_MemAvailable_bytes gauge
			node_memory_MemAvailable_bytes 6.69310976e+08
			TYPE node_memory_MemFree_bytes gauge
			node_memory_MemFree_bytes 3.91520256e+08
			TYPE node_memory_MemTotal_bytes gauge
			node_memory_MemTotal_bytes 1.024110592e+09
			TYPE node_memory_Mlocked_bytes gauge
			node_memory_Mlocked_bytes 1.8915328e+07
	* HDD:
	
			TYPE node_filesystem_avail_bytes gauge
			node_filesystem_avail_bytes{device="/dev/mapper/ubuntu--vg-ubuntu--lv",fstype="ext4",mountpoint="/"} 2.672216064e+10
			node_filesystem_avail_bytes{device="/dev/sda2",fstype="ext4",mountpoint="/boot"} 1.805344768e+09
			node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run"} 1.01412864e+08
			node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/lock"} 5.24288e+06
			node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/snapd/ns"} 1.01412864e+08
			node_filesystem_avail_bytes{device="tmpfs",fstype="tmpfs",mountpoint="/run/user/1000"} 1.02408192e+08
			
	* NET:
	
			TYPE node_network_address_assign_type gauge
			node_network_address_assign_type{device="eth0"} 0
			node_network_address_assign_type{device="lo"} 0
			TYPE node_network_carrier gauge
			node_network_carrier{device="eth0"} 1
			node_network_carrier{device="lo"} 1
			
3. Установите в свою виртуальную машину Netdata. Воспользуйтесь готовыми пакетами для установки (sudo apt install -y netdata).
	
	* Решение:

4. Можно ли по выводу dmesg понять, осознает ли ОС, что загружена не на настоящем оборудовании, а на системе виртуализации?
	
	* Решение: 
	
			vagrant@vagrant:~$ dmesg | grep Hypervisor
			[    0.000000] Hypervisor detected: KVM
			
5. Как настроен sysctl fs.nr_open на системе по-умолчанию? Определите, что означает этот параметр. Какой другой существующий лимит не позволит достичь такого числа (ulimit --help)?
	
	* Решение: fs.nr_open = 1048576 
	* Максимальное количество дескрипторов которое может быть открыто на данной машине 1024*1024 = 1048576

6. Запустите любой долгоживущий процесс (не ls, который отработает мгновенно, а, например, sleep 1h) в отдельном неймспейсе процессов; покажите, что ваш процесс работает под PID 1 через nsenter. Для простоты работайте в данном задании под root (sudo -i). Под обычным пользователем требуются дополнительные опции (--map-root-user) и т.д.

	* Решение: sudo -i
	* unshare -f --pid --mount-proc sleep 1h
	* В терминале 2 ps aux | greep sleep

			root        2018  0.0  0.4  11020  4620 pts/1    S+   22:29   0:00 sudo unshare -f --pid --mount-proc sleep 1h
			root        2019  0.0  0.0   7232   580 pts/1    S+   22:29   0:00 unshare -f --pid --mount-proc sleep 1h
			root        2020  0.0  0.0   7228   520 pts/1    S+   22:29   0:00 sleep 1h
			
7. Найдите информацию о том, что такое :(){ :|:& };:. Запустите эту команду в своей виртуальной машине Vagrant с Ubuntu 20.04 (это важно, поведение в других ОС не проверялось). Некоторое время все будет "плохо", после чего (минуты) – ОС должна стабилизироваться. Вызов dmesg расскажет, какой механизм помог автоматической стабилизации.
Как настроен этот механизм по-умолчанию, и как изменить число процессов, которое можно создать в сессии?

	* Решение: Форк Бомба создает свои копии пока не достигнет максимум. 

			[ 2634.139071] cgroup: fork rejected by pids controller in /user.slice/user-1000.slice/session-7.scope
			
	* по умолчанию ограничения Hard и Soft лимитами.
	* Изменять /etc/security/limits.conf
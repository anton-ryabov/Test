1. Установите Bitwarden плагин для браузера. Зарегестрируйтесь и сохраните несколько паролей.

    * Решение:
    * ![img_34.png](../img_34.png)

2. Установите Google authenticator на мобильный телефон. Настройте вход в Bitwarden акаунт через Google authenticator OTP.

    * Решение:
    * ![img_33.png](../img_33.png)

3. Установите apache2, сгенерируйте самоподписанный сертификат, настройте тестовый сайт для работы по HTTPS.

    * Решение:
    * установка Apache
    * ![img_35.png](img_35.png
    * ssl cert
    * ![img_36.png](../img_36.png)

4. Проверьте на TLS уязвимости произвольный сайт в интернете (кроме сайтов МВД, ФСБ, МинОбр, НацБанк, РосКосмос, РосАтом, РосНАНО и любых госкомпаний, объектов КИИ, ВПК ... и тому подобное).

    * Решение: Найдена уязвимость.
    * ![img_39.png](../img_39.png)

5. Установите на Ubuntu ssh сервер, сгенерируйте новый приватный ключ. Скопируйте свой публичный ключ на другой сервер. Подключитесь к серверу по SSH-ключу.

    * Решение: ![img_37.png](../img_37.png)

6. Переименуйте файлы ключей из задания 5. Настройте файл конфигурации SSH клиента, так чтобы вход на удаленный сервер осуществлялся по имени сервера.

    * Решение: В каталоге .ssh создать файл config
    * Host test.server
      * HostName 135.181.103.66
      * User root
      * Port 22
      * IdentityFile ~/.ssh/id_rsa
    * ![img_38.png](../img_38.png)

7. Соберите дамп трафика утилитой tcpdump в формате pcap, 100 пакетов. Откройте файл pcap в Wireshark.

    * Решение:
    * ![img_40.png](../img_40.png)
1. Работа c HTTP через телнет.

    * Решение:

            anton@anton-BOD-WXX9:~$ telnet stackoverflow.com 80
                    Trying 151.101.1.69...
                    Connected to stackoverflow.com.
                    Escape character is '^]'.
                    GET /questions HTTP/1.0
                    HOST: stackoverflow.com
                    
                    HTTP/1.1 403 Forbidden
                    Connection: close
                    Content-Length: 1920
                    Server: Varnish
                    Retry-After: 0
                    Content-Type: text/html
                    Accept-Ranges: bytes
                    Date: Mon, 30 Jan 2023 09:20:40 GMT
                    Via: 1.1 varnish
                    X-Served-By: cache-fra-eddf8230085-FRA
                    X-Cache: MISS
                    X-Cache-Hits: 0
                    X-Timer: S1675070441.673440,VS0,VE1
                    X-DNS-Prefetch-Control: off
                    
                    <!DOCTYPE html>
                    <html>
                    <head>
                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
                        <title>Forbidden - Stack Exchange</title>
                        <style type="text/css">
                            body
                            {
                                color: #333;
                                font-family: 'Helvetica Neue', Arial, sans-serif;
                                font-size: 14px;
                                background: #fff url('img/bg-noise.png') repeat left top;
                                line-height: 1.4;
                            }
                            h1
                            {
                                font-size: 170%;
                                line-height: 34px;
                                font-weight: normal;
                            }
                            a { color: #366fb3; }
                            a:visited { color: #12457c; }
                            .wrapper {
                                width:960px;
                                margin: 100px auto;
                                text-align:left;
                            }
                            .msg {
                                float: left;
                                width: 700px;
                                padding-top: 18px;
                                margin-left: 18px;
                            }
                        </style>
                    </head>
                    <body>
                        <div class="wrapper">
                            <div style="float: left;">
                                <img src="https://cdn.sstatic.net/stackexchange/img/apple-touch-icon.png" alt="Stack Exchange" />
                            </div>
                            <div class="msg">
                                <h1>Access Denied</h1>
                                            <p>This IP address (90.154.25.126) has been blocked from access to our services. If you believe this to be in error, please contact us at <a href="mailto:team@stackexchange.com?Subject=Blocked%2090.154.25.126%20(Request%20ID%3A%201881078618-FRA)">team@stackexchange.com</a>.</p>
                                            <p>When contacting us, please include the following information in the email:</p>
                                            <p>Method: block</p>
                                            <p>XID: 1881078618-FRA</p>
                                            <p>IP: 90.154.25.126</p>
                                            <p>X-Forwarded-For: </p>
                                            <p>User-Agent: </p>
                                            
                                            <p>Time: Mon, 30 Jan 2023 09:20:40 GMT</p>
                                            <p>URL: stackoverflow.com/questions</p>
                                            <p>Browser Location: <span id="jslocation">(not loaded)</span></p>
                            </div>
                        </div>
                        <script>document.getElementById('jslocation').innerHTML = window.location.href;</script>
                    </body>
                    </html>Connection closed by foreign host.

Код ответа на статус ошибки "HTTP 403 Forbidden" указывает, что сервер понял запрос, но отказывается его авторизовать.

2. Повторите задание 1 в браузере, используя консоль разработчика F12.

    * Решение: 
      * откройте вкладку Network
      * отправьте запрос http://stackoverflow.com
      * найдите первый ответ HTTP сервера, откройте вкладку Headers
        * ![img_18.png](img_18.png)
      * укажите в ответе полученный HTTP код 
        * 307 Internal Redirect
      * проверьте время загрузки страницы, какой запрос обрабатывался дольше всего? 
        * ![img_19.png](img_19.png)
        * время полной загрузки 1.26 с

3. Какой IP адрес у вас в интернете?

    * Решение: 90.154.25.126 

4. Какому провайдеру принадлежит ваш IP адрес? Какой автономной системе AS? Воспользуйтесь утилитой whois

    * Решение:
      * origin:AS12389
      * mnt-by:ROSTELECOM-MNT

5. Через какие сети проходит пакет, отправленный с вашего компьютера на адрес 8.8.8.8? Через какие AS? Воспользуйтесь утилитой traceroute

    * Решение: 
    * ![img_20.png](img_20.png)

6. Повторите задание 5 в утилите mtr. На каком участке наибольшая задержка - delay?

    * Решение: 
    * ![img_21.png](img_21.png)

7. Какие DNS сервера отвечают за доменное имя dns.google? Какие A записи? Воспользуйтесь утилитой dig

    * Решение: 
    * ![img_23.png](img_23.png)

8. Проверьте PTR записи для IP адресов из задания 7. Какое доменное имя привязано к IP? Воспользуйтесь утилитой dig

    * Решение: 
    * ![img_22.png](img_22.png)
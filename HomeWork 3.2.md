1. Какого типа команда cd? Попробуйте объяснить, почему она именно такого типа: опишите ход своих мыслей, если считаете, что она могла бы быть другого типа.

	* Решение: cd — это встроенная команда bash. Думаю потому это основная функция. Допустим при смене переменной PATH на пустоту у нас остается возможность исправить это.
	 
2. Какая альтернатива без pipe команде grep <some_string> <some_file> | wc -l

	* Решение: 

3. Какой процесс с PID 1 является родителем для всех процессов в вашей виртуальной машине Ubuntu 20.04?

	* Решение: systemd

4. Как будет выглядеть команда, которая перенаправит вывод stderr ls на другую сессию терминала?

	* Решение: ls \blablabl 2>/dev/pts/1

5. Получится ли одновременно передать команде файл на stdin и вывести ее stdout в другой файл? Приведите работающий пример.

	* Решение:

6. Получится ли, находясь в графическом режиме, вывести данные из PTY в какой-либо из эмуляторов TTY? Сможете ли вы наблюдать выводимые данные?

	* Решение:
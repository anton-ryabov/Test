1. Узнайте о sparse (разряженных) файлах.
	
	* Решение: Цитата: файл, в котором последовательности нулевых байтов заменены на информацию об этих последовательностях (список дыр).
	
2. Могут ли файлы, являющиеся жесткой ссылкой на один объект, иметь разные права доступа и владельца? Почему?
	
	* Решение: Нет. это ссылки на одну и ту же inode.
	
3. Сделайте vagrant destroy на имеющийся инстанс Ubuntu. Замените содержимое Vagrantfile следующим:

	* Решение: 
	*  ![image](https://user-images.githubusercontent.com/120400945/215331091-104d086f-c6c8-4a9b-9f5e-f1d4e1a8a442.png)

4. Используя fdisk, разбейте первый диск на 2 раздела: 2 Гб, оставшееся пространство.

	* Решение: 
	* ![img.png](../img.png)
   
5. Используя sfdisk, перенесите данную таблицу разделов на второй диск.
	
	* Решение: 
	* ![img_1.png](../img_1.png)
   
6. Соберите mdadm RAID1 на паре разделов 2 Гб.

	* Решение: 
	* ![img_3.png](../img_3.png)

7. Соберите mdadm RAID0 на второй паре маленьких разделов.

	* Решение: 
	* ![img_4.png](../img_4.png)

8. Создайте 2 независимых PV на получившихся md-устройствах.

	* Решение:
    	* ![img_5.png](../img_5.png)
   
9. Создайте общую volume-group на этих двух PV.

	* Решение: 
	* ![img_6.png](../img_6.png)

10. Создайте LV размером 100 Мб, указав его расположение на PV с RAID0.

	* Решение: 
	* ![img_7.png](../img_7.png)

11. Создайте mkfs.ext4 ФС на получившемся LV.

	* Решение: 
	* ![img_8.png](../img_8.png)

12. Смонтируйте этот раздел в любую директорию, например, /tmp/new.

	* Решение: 
	* ![img_9.png](../img_9.png)

13. Поместите туда тестовый файл, например wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz.

	* Решение: 
	* ![img_10.png](../img_10.png)

14. Прикрепите вывод lsblk.

	* Решение: 
	* ![img_11.png](../img_11.png)

15. Протестируйте целостность файла:

	* Решение: 
    	* ![img_12.png](../img_12.png)

16. Используя pvmove, переместите содержимое PV с RAID0 на RAID1.

	* Решение: 
    	* ![img_13.png](../img_13.png)

17. Сделайте --fail на устройство в вашем RAID1 md.

	* Решение: 
    	* ![img_14.png](../img_14.png)

18. Подтвердите выводом dmesg, что RAID1 работает в деградированном состоянии.

	* Решение: 
	* ![img_15.png](../img_15.png)

19. Протестируйте целостность файла, несмотря на "сбойный" диск он должен продолжать быть доступен.

	* Решение: 
	* ![img_16.png](../img_16.png)

20. Погасите тестовый хост, vagrant destroy

	* Решение:
	* ![img_17.png](../img_17.png)
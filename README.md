# my-local-nas

Локальное хранилище и файлообменник на базе Debian, Apache и Samba.

![Debian](https://img.shields.io/badge/Debian-%23D70A53.svg?style=for-the-badge&logo=debian&logoColor=white)
![Apache](https://img.shields.io/badge/apache-%23D42029.svg?style=for-the-badge&logo=apache&logoColor=white)


### 🌍 Актуальность проекта
Данная сборка незаменима в условиях **ограничения интернета, блокировок и жесткой цензуры**.
сервер разворачивается полностью локально.

p.s.: Если этот репозиторий помог вам, пожалуйста, поставьте ему звезду

## ✔Быстрый старт
Запустите `setup.sh` и следуйте указаниям.

## 💻 Характеристики NAS
* **Устройство:** Acer Aspire One
* **Процессор:** Intel Atom N450
* **Оперативная память:** 2 GB DDR2
* **Операционная система:** Debian GNU/Linux 12


## 🛠 Стек
* **Веб-интерфейс:** Apache 2
* **Протокол обмена:** Samba (SMB) для обращения к сетевой папке

## 📜 Лицензия
проект защищен лицензией **The Unlicense**.

---

## Ручная установка


```
sudo apt update && sudo apt install -y samba apache2
```
Выставляем права, чтобы **Samba** и **Apache** могли одновременно работать с файлами:

```
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 775 /var/www/html/
```
Добавляем пользователя в **Samba**:

```
sudo smbpasswd -a $USER
```
(Вместо `$USER` можно вписать конкретное имя пользователя)

Добавляем блок с названием сетевой папки: (пример)
```
[www-share]
   comment = Apache Web Root
   path = /var/www/html
   browseable = yes
   writable = yes
   valid users = @smbgroup, user1
   force user = www-data
   force group = www-data
   create mask = 0664
   directory mask = 0775
```

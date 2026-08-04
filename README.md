# my-local-nas

Локальное хранилище и файлообменник на базе Debian, Apache Autoindex и Samba.

### 🌍 Актуальность проекта
Данная сборка незаменима в условиях **ограничения интернета, блокировок и жесткой цензуры**.
сервер разворачивается полностью локально.

## 💻 Характеристики NAS
* **Устройство:** Acer Aspire One
* **Процессор:** Intel Atom N450
* **Оперативная память:** 2 GB DDR2
* **Операционная система:** Debian GNU/Linux 12


## 🛠 Стек
* **Веб-интерфейс:** Apache 2
* **Протокол обмена:** Samba (SMB) для обращения к сетевому диску

## 📜 Лицензия
проект защищен лицензией **The Unlicense**.

---

# Установка

```
sudo apt update && sudo apt install -y samba apache2
```
Выставляем права, чтобы **Samba** и **Apache** могли одновременно работать с файлами:

```
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 775 /var/www/html/
sudo systemctl restart smbd apache2
```
Добавляем пользователя в **Samba**:

```
sudo smbpasswd -a $USER
```
(Вместо `$USER` можно вписать конкретное имя пользователя)

Если хотите установить сверху **phpsysinfo** то устанавливаем модули:

```
sudo apt install -y php libapache2-mod-php

sudo apt install -y php-xml

sudo systemctl restart apache2
```
После этого можете создавать под **phpsysinfo** отдельную папку.


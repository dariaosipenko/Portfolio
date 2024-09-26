Таблица - users						
ID	email	                mobile_number				
1	qwerty@gmail.com	71234567890				
2						
3						

Таблица - personal_data
id	users_id	birthday_date
1	1	         1990-01-01
2	2
3	3

1. Найти количество всех юзеров с почтой yandex
SELECT COUNT(ID) FROM users
WHERE email LIKE %@yandex%

2. Найти всех юзеров с датой рождения с 1995 по 2000 года с сортировкой по возрастанию (в выводе отобразить поля birthday_date, email, mobile_number)

SELECT birthday_date, email, mobile_number
FROM users
JOIN personal_data ON users.id=personal_data.users_id
WHERE birthday_date BETWEEN '1995-01-01' AND '1999-12-31'
ORDER BY birthday_date

3. Вывести последнего добавленного в бд юзера, у которого нет даты рождения

SELECT * FROM users
JOIN personal_data ON users.id=personal_data.users_id
WHERE birthday_date IS NULL
ORDER BY id DESC
LIMIT 1


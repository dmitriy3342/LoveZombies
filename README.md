(это довольно легко)
1. Напишите игру "Крестики-нолики"
	Для начала сойдет совсем простенькая версия без искусственного интеллекта (для двух игроков)
	Пример плана работы (можно на него опираться)
		Начните писать игру с отображения пустого поля 3х3
		Потом добавьте отрисовку крестиков/ноликов
			Пусть, например, они хранятся в виде символов "х", "о" в массиве 3х3
		Потом добавьте обработчик нажатия мышки
			Фишка в том, что координаты мышки - это координаты пикселя, над которым висит указатель мышки.
			Надо каким-то образом переводить эти координаты в координаты клетки игрового поля
			Пусть для начала при нажатии мышкой по окну где-нибудь выведутся:
				"Графические" координаты мышки
				"Логические" координаты клетки
			Когда графические координаты будут нормально переводиться в логические, можно будет уже заниматься добавлением крестиков/ноликов на игровое поле
		Ну и остается сделать только проверку выйгрыша после каждого хода.
	А если вы хорошо умеете играть в крестики-нолики, то не очень сложно будет написать искусственный интеллект

(это, видимо, сложнее всего)
2. Напишите игру "Шашки"
	Аналогично предыдущей игре.
	Не то что бы писать шашки сложнее, но искусственный интеллект тут явно посложнее будет делать
	Чуть-чуть сложнее будет делать проверку на допустимость хода
	Зато проверка на выйгрыш будет гораздо проще и короче

(это как-то средне по сложности)
3. Напишите игру "Lines"
	Аналогично крестикам-ноликам.
	Но искусственный интеллект вообще не нужен.

(это вроде тоже как-то средне)
4. Напишите игру "Zombies"
	Ээ... Что это именно за игра - можно посмотреть на freeshell.org
	Сам давно хотел ее написать, потому что найти именно такую версию я не смог, а лазить на фришелл каждый раз неохота
	Может быть, будем писать ее вместе с кем-нибудьLoveZombies
===========

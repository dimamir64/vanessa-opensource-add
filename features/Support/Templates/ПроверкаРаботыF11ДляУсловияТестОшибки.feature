# language: ru

@IgnoreOnCIMainBuild
@tree

Функциональность: Тест

Сценарий: Сценарий №1
		Если Это специальное условие "Парам" для ПроверкаРаботыF11ДляУсловияТестОшибки Тогда
				| 'Регистрация' |
				| 'Да'          |
				И я закрываю текущее окно
				И     в таблице "Список" я перехожу к строке:
				| 'ИмяКолонки'    |
				| "Значение" |

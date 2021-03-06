@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функциональность: Тест

Сценарий: внешний служебный сценарий для теста перехода к строке
	И Я запоминаю значение выражения "1" в переменную "ТестоваяПеременная"


Сценарий: Второй сценарий. Не предназначен для экспорта.
	*Первая группа
		И Я запоминаю значение выражения "1" в переменную "ТестоваяПеременная"
		И Я запоминаю значение выражения "1" в переменную "ТестоваяПеременная"
	*Вторая группа
		*Третья группа
			И Я запоминаю значение выражения "1" в переменную "ТестоваяПеременная"
			И Я запоминаю значение выражения "1" в переменную "ТестоваяПеременная"
			Дано Я задаю таблицу строк "Таблица"
				| 'Товар1' |
				| 'Товар2' |
			И для каждого значения "ЗначениеИзМассива" из таблицы в памяти "Таблица"
					И Я запоминаю значение выражения "1" в переменную "ТестоваяПеременная"
					Если "Ложь" Тогда
						Тогда Я вызываю исключение "В таблице должны быть строки!"
					И внешний служебный сценарий для теста перехода к строке
		*Четвертая группа
			И Я запоминаю значение выражения "1" в переменную "ТестоваяПеременная"

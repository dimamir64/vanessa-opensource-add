
//{ основная процедура для юнит-тестирования 1CUnit
Перем _тестируем; // для тестирования
Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДваПлюсДваРавноЧетыре");
	
	Возврат ВсеТесты;
	
КонецФункции
//}

//{ ОСНОВНОЙ БЛОК

//} КОНЕЦ ОСНОВНОГО БЛОКА

//{ БЛОК ЮНИТ-ТЕСТОВ - сами тесты

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьДваПлюсДваРавноЧетыре() Экспорт
	юТест.ПроверитьРавенство(2 + 2, 4);
КонецПроцедуры

_тестируем = Ложь;

//} КОНЕЦ БЛОКА ЮНИТ-ТЕСТОВ
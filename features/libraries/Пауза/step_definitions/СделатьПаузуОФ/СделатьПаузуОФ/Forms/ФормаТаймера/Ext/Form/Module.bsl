Перем Ванесса;
Перем ЖдатьСекунд;
Перем ПрошлоСекунд;

Процедура ПроцОбработчикОжидания() 
	ПрошлоСекунд = ПрошлоСекунд + 1;
	Если ПрошлоСекунд >= ЖдатьСекунд Тогда
		ОтключитьОбработчикОжидания("ПроцОбработчикОжидания");
		Ванесса.ПродолжитьВыполнениеШагов();
		ЭтаФорма.Закрыть();
		Возврат;
	КонецЕсли;	
КонецПроцедуры

Процедура ПодключитьТаймер(КонтекстФреймворкаBDD,КолСек) Экспорт
	Ванесса      = КонтекстФреймворкаBDD;
	ЖдатьСекунд  = КолСек;
	ПрошлоСекунд = 0;
	ЭтаФорма.Заголовок = "ПАУЗА " + ЖдатьСекунд;
	ПодключитьОбработчикОжидания("ПроцОбработчикОжидания",1);
КонецПроцедуры

Процедура КнопкаВыполнитьНажатие(Кнопка)
	// Вставить содержимое обработчика.
КонецПроцедуры

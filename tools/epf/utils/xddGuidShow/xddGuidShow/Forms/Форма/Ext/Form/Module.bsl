//#Если ТолстыйКлиентОбычноеПриложение Тогда

Процедура ПоказатьГУИДНажатие(Элемент)
	
	Если ПроверитьЗаполнение() Тогда
		ГУИД = Ссылка.УникальныйИдентификатор();
	КонецЕсли;
	
КонецПроцедуры

Процедура СсылкаПриИзменении(Элемент)
	
	Если ЗначениеЗаполнено(Ссылка) Тогда
		ГУИД = Ссылка.УникальныйИдентификатор();
	Иначе
		ГУИД = "";
	КонецЕсли;
	
КонецПроцедуры

//#КонецЕсли 

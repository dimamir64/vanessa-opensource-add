Функция ПодключитьВнешнююОбработку(АдресХранилища, ИдентификаторОбработки, ПолныйПутьФайлаОбработки) Экспорт
	//#Если Клиент Тогда
	//Возврат ПолныйПутьФайлаОбработки;
	//#Иначе
	ИД =  ВнешниеОбработки.Подключить(АдресХранилища, ИдентификаторОбработки, Ложь); // подключаю не в безопасном режиме
	ВнешниеОбработки.Создать(ИдентификаторОбработки);
	Возврат ИдентификаторОбработки;
	//#КонецЕсли
КонецФункции

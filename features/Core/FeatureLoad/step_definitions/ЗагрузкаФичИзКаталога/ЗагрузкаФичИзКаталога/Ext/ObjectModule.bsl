//начало текста модуля

Перем Ванесса;

Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;

	ВсеТесты = Новый Массив;

	// описание шагов
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздалСлужебныйФайлВОтноситекльномКаталогеСИменем(Парам01,Парам02)","ЯСоздалСлужебныйФайлВОтноситекльномКаталогеСИменем","я создал служебный файл в относитекльном каталоге ""features\Core"" с именем ""TestFile""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагрузилФичиИзОтносительногоКаталога(Парам01)","ЯЗагрузилФичиИзОтносительногоКаталога","я загрузил фичи из относительного каталога ""features\Core""");

	Возврат ВсеТесты;
КонецФункции


Процедура ПередНачаломСценария() Экспорт
КонецПроцедуры


Процедура ПередОкончаниемСценария() Экспорт
	Если Контекст.Свойство("ИмяСлужебногоФайла") Тогда
		УдалитьФайлы(Контекст.ИмяСлужебногоФайла);
	КонецЕсли;

	Попытка
		Если Контекст.Свойство("ОткрытаяФормаVanessaADD") Тогда
			ОткрытаяФормаVanessaADD = Контекст.ОткрытаяФормаVanessaADD;
			ОткрытаяФормаVanessaADD.Закрыть();
		КонецЕсли;
	Исключение

	КонецПопытки;

КонецПроцедуры




//я создал служебный файл в относитекльном каталоге "features\Core" с именем "TestFile"
//@ЯСоздалСлужебныйФайлВОтноситекльномКаталогеСИменем(Парам01,Парам02)
Процедура ЯСоздалСлужебныйФайлВОтноситекльномКаталогеСИменем(ОтносительныйКаталог,ИмяФайла) Экспорт
	ИмяСлужебногоФайла = Ванесса.КаталогИнструментов + "\" + ОтносительныйКаталог + "\" + ИмяФайла;
	ФайлПроверкаСуществования = Новый Файл(ИмяСлужебногоФайла);
	Если ФайлПроверкаСуществования.Существует() Тогда
		УдалитьФайлы(ИмяСлужебногоФайла);
	КонецЕсли;

	ЗТ = Новый ЗаписьТекста(ИмяСлужебногоФайла,"UTF-8",,Истина);
	ЗТ.ЗаписатьСтроку("");
	ЗТ.Закрыть();


	Контекст.Вставить("ИмяСлужебногоФайла",ИмяСлужебногоФайла);
КонецПроцедуры


//я загрузил фичи из относительного каталога "features\Core"
//@ЯЗагрузилФичиИзОтносительногоКаталога(Парам01)
Процедура ЯЗагрузилФичиИзОтносительногоКаталога(ОтносительныйКаталог) Экспорт
	Контекст.ОткрытаяФормаVanessaADD.КаталогФич = Ванесса.КаталогИнструментов + "\" + ОтносительныйКаталог;
	Контекст.ОткрытаяФормаVanessaADD.ЗагрузитьФичи();
КонецПроцедуры


//окончание текста модуля
//начало текста модуля
&НаКлиенте
Перем Ванесса;
 
&НаКлиенте
Перем Контекст Экспорт;
 
&НаКлиенте
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	// описание шагов
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(МассивТестов, Снипет, ИмяПроцедуры,ПредставлениеТеста = Неопределено,ОписаниеШага = Неопределено,ТипШагаДляОписания = Неопределено,ТипШагаВДереве = Неопределено);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВМетаданныхЕстьРегистрСведений(Парам01)","ВМетаданныхЕстьРегистрСведений","Когда в метаданных есть РегистрСведений ""РегистрСведений1""", "Проверяет наличие регистра сведений в метаданных ИБ", "Данные.Регистры сведений");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУдаляюВсеЗаписиРегистрСведений(Парам01)","ЯУдаляюВсеЗаписиРегистрСведений","И я удаляю все записи РегистрСведений ""РегистрСведений1""", "Удаляются все записи регистра сведений из ИБ", "Данные.Регистры сведений");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВБазеНетЗаписейРегистрСведений(Парам01)","ВБазеНетЗаписейРегистрСведений","И в базе нет записей РегистрСведений ""РегистрСведений1""", "Проверяет отсутствие записей в регистре сведений", "Данные.Регистры сведений");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздалFixtureРегистрСведенийПоМакету(Парам01)","ЯСоздалFixtureРегистрСведенийПоМакету","И я создал  fixture РегистрСведений по макету ""Макет"".Регистры сведений");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВБазеПоявиласьХотяБыОднаЗаписьРегистрСведений(Парам01)","ВБазеПоявиласьХотяБыОднаЗаписьРегистрСведений","Тогда В базе появилась хотя бы одна запись РегистрСведений ""РегистрСведений1""", "Проверяет наличие хотя бы одной записи регистра сведений", "Данные.Регистры сведений");

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


&НаСервереБезКонтекста
Функция ВМетаданныхЕстьРССервер(ВидРС)
	Нашел = Ложь;
	Для каждого Элем Из Метаданные.РегистрыСведений Цикл
		Имя = Элем.Имя;
		Если НРег(Имя) = НРег(ВидРС) Тогда
			Нашел = Истина;
			Прервать;
		КонецЕсли;	 
	КонецЦикла;
	
	Возврат Нашел; 
КонецФункции	


&НаКлиенте
//Когда в метаданных есть РегистрСведений "РегистрСведений1"
//@ВМетаданныхЕстьРегистрСведений(Парам01)
Процедура ВМетаданныхЕстьРегистрСведений(ВидРС) Экспорт
	Нашел = ВМетаданныхЕстьРССервер(ВидРС);
	
	Ванесса.ПроверитьРавенство(Нашел,Истина,"В метаданных есть вид РС " + ВидРС);
КонецПроцедуры


&НаСервереБезКонтекста
Процедура ЯУдаляюВсеЗаписиРС(ВидРС)
	НаборЗаписей = РегистрыСведений[ВидРС].СоздатьНаборЗаписей();
	НаборЗаписей.Записать();
КонецПроцедуры

&НаКлиенте
//И я удаляю все записи РегистрСведений "РегистрСведений1"
//@ЯУдаляюВсеЗаписиРегистрСведений(Парам01)
Процедура ЯУдаляюВсеЗаписиРегистрСведений(ВидРС) Экспорт
	ЯУдаляюВсеЗаписиРС(ВидРС);
КонецПроцедуры


&НаСервереБезКонтекста
Функция ВБазеНетЗаписейРССервер(ВидРС)
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ ПЕРВЫЕ 1
		|	*
		|ИЗ
		|	РегистрСведений.РегистрСведений1 КАК РегистрСведений1";

	Запрос.Текст = СтрЗаменить(Запрос.Текст,"РегистрСведений1",ВидРС);	
	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Возврат 1;
	КонецЦикла;
	
	Возврат 0;

КонецФункции	

&НаКлиенте
//И в базе нет записей РегистрСведений "РегистрСведений1"
//@ВБазеНетЗаписейРегистрСведений(Парам01)
Процедура ВБазеНетЗаписейРегистрСведений(ВидРС) Экспорт
	КолЭлементов = ВБазеНетЗаписейРССервер(ВидРС);
	Ванесса.ПроверитьРавенство(КолЭлементов,0,"Не должно быть записей");
КонецПроцедуры




&НаСервере
Функция ПолучитьМакетСервер(Имямакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(Имямакета);
КонецФункции	


&НаКлиенте
//И я создал  fixture РегистрСведений по макету "Макет"
//@ЯСоздалFixtureРегистрСведенийПоМакету(Парам01)
Процедура ЯСоздалFixtureРегистрСведенийПоМакету(ИмяМакета) Экспорт
	Макет = ПолучитьМакетСервер(ИмяМакета);
	Плагин = Ванесса.Плагин("СериализаторMXL");
	СтруктураДанных = Плагин.СоздатьДанныеПоТабличномуДокументу(Макет);
	//СтруктураДанных = Ванесса.СоздатьДанныеПоТабличномуДокументу(Макет);
	Ванесса.ПроверитьНеРавенство(СтруктураДанных,Неопределено,"Получили структуру данных.");
КонецПроцедуры


&НаСервереБезКонтекста
Функция ВБазеПоявиласьХотяБыОднаЗаписьРССервер(ВидРС)
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ ПЕРВЫЕ 1
		|	*
		|ИЗ
		|	РегистрСведений.РегистрСведений1 КАК РегистрСведений1";

	Запрос.Текст = СтрЗаменить(Запрос.Текст,"РегистрСведений1",ВидРС);	
	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Возврат 1;
	КонецЦикла;
	
	Возврат 0;

КонецФункции	

&НаКлиенте
//В базе появилась хотя бы один элемент справочника "Справочник1"
//@ВБазеПоявиласьХотяБыОдинЭлементСправочника(Парам01Строка)
Процедура ВБазеПоявиласьХотяБыОднаЗаписьРегистрСведений(ВидРС) Экспорт
	КолЭлементов = ВБазеПоявиласьХотяБыОднаЗаписьРССервер(ВидРС);
	Ванесса.ПроверитьНеРавенство(КолЭлементов,0,"В базе должны быть записи");
КонецПроцедуры


//окончание текста модуля


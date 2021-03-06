Перем КонтекстЯдра;
Перем Утверждения;

#Область Основные_процедуры_теста

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов, КонтекстЯдраПараметр) Экспорт
	
	КонтекстЯдра = КонтекстЯдраПараметр;
		
	ДобавитьОбщиеМакеты(НаборТестов);
	
	ДобавитьМакетМетаданных(НаборТестов);	
	
КонецПроцедуры

#Область События_юнит_тестирования

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт

КонецПроцедуры

#КонецОбласти

Процедура ТестДолжен_ПроверитьМакетСКД(ИмяМенеджера, ИмяОбьекта, ИмяМакета) Экспорт
	
	Менеджер = МенеджерОбьектаПоИмени(ИмяМенеджера);
	
	СхемаКомпоновкиДанных = Менеджер[ИмяОбьекта].ПолучитьМакет(СокрЛП(ИмяМакета));
	
	ПроверитьСхемуСКД(СхемаКомпоновкиДанных);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьОбщийМакетСКД(ИмяМакета) Экспорт
	
	СхемаКомпоновкиДанных = ПолучитьОбщийМакет(ИмяМакета);
	
	ПроверитьСхемуСКД(СхемаКомпоновкиДанных);
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВложенныйМакетСКД(ИмяМенеджера, ИмяОбьекта, ИменаМакетов) Экспорт
	
	ИменаМакетов = КонтекстЯдра.РазложитьСтрокуВМассивПодстрок(ИменаМакетов, "->");
	
	Если ИмяОбьекта = ТекстОбщиеМакеты() Тогда
		СхемаКомпоновкиДанных = ПолучитьОбщийМакет(ИменаМакетов[0]);
	Иначе
		Менеджер = МенеджерОбьектаПоИмени(ИмяМенеджера);
		СхемаКомпоновкиДанных = Менеджер[ИмяОбьекта].ПолучитьМакет(ИменаМакетов[0]);
	КонецЕсли;
	
	Для ВложенностьМакета = 1 По ИменаМакетов.Количество() - 1 Цикл
		ВложенныеСхемыКомпоновкиДанных = СхемаКомпоновкиДанных.ВложенныеСхемыКомпоновкиДанных;
		СхемаКомпоновкиДанных = ВложенныеСхемыКомпоновкиДанных.Найти(ИменаМакетов[ВложенностьМакета]).Схема;
	КонецЦикла;
	
	ПроверитьСхемуСКД(СхемаКомпоновкиДанных);
	
КонецПроцедуры

#КонецОбласти

#Область Служебные_функции_и_процедуры

Процедура ДобавитьОбщиеМакеты(НаборТестов)
	
	мНаборов = Новый Массив;
	
	Для Каждого ОбщийМакет Из Метаданные.ОбщиеМакеты Цикл
		
		Если ОбщийМакет.ТипМакета <> Метаданные.СвойстваОбъектов.ТипМакета.СхемаКомпоновкиДанных Тогда
			Продолжить;
		КонецЕсли;
		
		мНаборов.Добавить(
			Новый Структура("ИмяПроцедуры, Параметры, Представление",
				"ТестДолжен_ПроверитьОбщийМакетСКД",
				НаборТестов.ПараметрыТеста(ОбщийМакет.Имя),
				КонтекстЯдра.СтрШаблон_(ШаблонПредставления(), ТекстОбщиеМакеты(), ОбщийМакет.Имя)));	
				
		ДобавитьВложенныеМакеты(мНаборов, ОбщийМакет, ОбщийМакет.Имя, ТекстОбщиеМакеты());
				
	КонецЦикла;
			
	Если мНаборов.Количество() > 0 Тогда
		
		НаборТестов.НачатьГруппу(ТекстОбщиеМакеты(), Ложь);
		
		Для Каждого Набор Из мНаборов Цикл
			
			НаборТестов.Добавить(Набор.ИмяПроцедуры, Набор.Параметры, Набор.Представление);
			
		КонецЦикла;
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ДобавитьМакетМетаданных(НаборТестов)
	
	ПроверяемыеОбъекты = ПроверяемыеМетаданные();
	
	Для Каждого ПроверяемыйОбъект Из ПроверяемыеОбъекты Цикл
		
		мНаборов = Новый Массив;
		
		Для Каждого ТекОбъект Из Метаданные[ПроверяемыйОбъект] Цикл
			
			ИмяМенеджера = ВРЕГ(ПроверяемыйОбъект);
			
			Для Каждого ТекДанныеМакета Из ТекОбъект.Макеты Цикл
				
				Если ТекДанныеМакета.ТипМакета <> Метаданные.СвойстваОбъектов.ТипМакета.СхемаКомпоновкиДанных Тогда
					Продолжить;
				КонецЕсли;
				
				мНаборов.Добавить(
					Новый Структура("ИмяПроцедуры, Параметры, Представление",
						"ТестДолжен_ПроверитьМакетСКД",
						НаборТестов.ПараметрыТеста(ИмяМенеджера, ТекОбъект.Имя, ТекДанныеМакета.Имя),
						КонтекстЯдра.СтрШаблон_(ШаблонПредставления(), ТекОбъект.Имя, ТекДанныеМакета.Имя)));
											
				ДобавитьВложенныеМакеты(мНаборов, ТекДанныеМакета, ТекДанныеМакета.Имя, ТекОбъект.Имя, ИмяМенеджера);
						
			КонецЦикла;
			
		КонецЦикла;
		
		Если мНаборов.Количество() > 0 Тогда
			
			НаборТестов.НачатьГруппу(ПроверяемыйОбъект, Ложь);
			
			Для Каждого Набор Из мНаборов Цикл
				
				НаборТестов.Добавить(Набор.ИмяПроцедуры, Набор.Параметры, Набор.Представление);
				
			КонецЦикла;
			
		КонецЕсли;
		
	КонецЦикла;
	
КонецПроцедуры

Процедура ДобавитьВложенныеМакеты(МассивТестов, Родитель, ИмяРодителя, ИмяОбъекта = "", ИмяМенеджера = "")
	
	Если ТипЗнч(Родитель) = Тип("ВложеннаяСхемаКомпоновкиДанных") Тогда
		Макет = Родитель.Схема;
	ИначеЕсли ЗначениеЗаполнено(ИмяМенеджера) Тогда
		Менеджер = МенеджерОбьектаПоИмени(ВРег(ИмяМенеджера));
		Макет = Менеджер[ИмяОбъекта].ПолучитьМакет(СокрЛП(Родитель.Имя));
	Иначе
		Макет = ПолучитьОбщийМакет(Родитель.Имя);
	КонецЕсли;
	
	Для Каждого ВложенныйМакет Из Макет.ВложенныеСхемыКомпоновкиДанных Цикл
		
		ИмяМакета = КонтекстЯдра.СтрШаблон_("%1->%2", ИмяРодителя, ВложенныйМакет.Имя);	
		Представление = КонтекстЯдра.СтрШаблон_(ШаблонПредставления(), ИмяОбъекта, ИмяМакета);
		
		ПараметрыТеста = Новый Массив;
		ПараметрыТеста.Добавить(ИмяМенеджера);
		ПараметрыТеста.Добавить(ИмяОбъекта);
		ПараметрыТеста.Добавить(ИмяМакета);
		
		СтруктураТеста = Новый Структура;
		СтруктураТеста.Вставить("ИмяПроцедуры", "ТестДолжен_ПроверитьВложенныйМакетСКД");
		СтруктураТеста.Вставить("Параметры", ПараметрыТеста);
		СтруктураТеста.Вставить("Представление", Представление);
		МассивТестов.Добавить(СтруктураТеста);			
		
		ДобавитьВложенныеМакеты(МассивТестов, ВложенныйМакет, ИмяМакета, ИмяОбъекта, ИмяМенеджера);
		
	КонецЦикла;
	
КонецПроцедуры

Процедура ПроверитьСхемуСКД(СхемаКомпоновкиДанных)

	ДанныеРасшифровки = Новый ДанныеРасшифровкиКомпоновкиДанных;
	
	КомпоновщикНастроекКомпоновкиДанных = Новый КомпоновщикНастроекКомпоновкиДанных;
	ИсточникДоступныхНастроекКомпоновкиДанных = Новый ИсточникДоступныхНастроекКомпоновкиДанных(СхемаКомпоновкиДанных);
	
	// Тут проходит синтаксический анализ запроса.
    КомпоновщикНастроекКомпоновкиДанных.Инициализировать(ИсточникДоступныхНастроекКомпоновкиДанных);
	
КонецПроцедуры

Функция ПроверяемыеМетаданные()
	
	ПроверяемыеОбъекты = Новый Массив();
	ПроверяемыеОбъекты.Добавить("Справочники");
	ПроверяемыеОбъекты.Добавить("Документы");
	ПроверяемыеОбъекты.Добавить("Обработки");
	ПроверяемыеОбъекты.Добавить("Отчеты");
	ПроверяемыеОбъекты.Добавить("Перечисления");
	ПроверяемыеОбъекты.Добавить("ПланыВидовХарактеристик");
	ПроверяемыеОбъекты.Добавить("ПланыСчетов");
	ПроверяемыеОбъекты.Добавить("ПланыВидовРасчета");
	ПроверяемыеОбъекты.Добавить("РегистрыСведений");
	ПроверяемыеОбъекты.Добавить("РегистрыНакопления");
	ПроверяемыеОбъекты.Добавить("РегистрыБухгалтерии");
	ПроверяемыеОбъекты.Добавить("РегистрыРасчета");
	ПроверяемыеОбъекты.Добавить("БизнесПроцессы");
	ПроверяемыеОбъекты.Добавить("Задачи");
	
	Возврат ПроверяемыеОбъекты;
	
КонецФункции

Функция МенеджерОбьектаПоИмени(Знач ИмяМенеджера)
	
	Попытка
	    Менеджер = Вычислить(ИмяМенеджера);
	Исключение
		Менеджер = Неопределено;	
	КонецПопытки;
		
	Возврат Менеджер;
	
КонецФункции

Функция ШаблонПредставления()
	Возврат НСтр("ru='Валидация корректности запроса СКД в %1: %2';en='Validation of the correctness of the CDSS request to %1: %2'");
КонецФункции

Функция ТекстОбщиеМакеты()
	Возврат "ОбщиеМакеты";
КонецФункции

#КонецОбласти
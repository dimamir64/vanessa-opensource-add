
&НаКлиенте
Процедура ПриОткрытии(Отказ)
	ЗаполнитьДеревоМетаданных(Неопределено);
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьДеревоМетаданных(Команда)
	ЗаполнитьДеревоМетаданныхНаСервере();
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьДеревоМетаданныхНаСервере()
	
	ДЗ = РеквизитФормыВЗначение("ДеревоМетаданных");
	
	ДЗ.Строки.Очистить();
	
	ВидыПроверок = Новый Массив;
	ВидыПроверок.Добавить("Списки");
	ВидыПроверок.Добавить("Новые");
	ВидыПроверок.Добавить("Существующие");
	
	//добавляем справочники
	ДобавитьМетаданныеВДерево(ВидыПроверок,ДЗ,"Справочники");
	
	//добавляем документв
	ДобавитьМетаданныеВДерево(ВидыПроверок,ДЗ,"Документы");
	
	//добавляем отчеты
	ДобавитьМетаданныеВДерево(Новый Массив,ДЗ,"Отчеты");
	
	//добавляем обработки
	ДобавитьМетаданныеВДерево(Новый Массив,ДЗ,"Обработки");
	
	ЗначениеВРеквизитФормы(ДЗ,"ДеревоМетаданных");
	
КонецПроцедуры

&НаСервере
Процедура ДобавитьМетаданныеВДерево(ВидыПроверок,Дерево,ВидМетаданных)
	
	СтрокаМетаданных = Дерево.Строки.Добавить();
	СтрокаМетаданных.ВидМетаданных          = ВидМетаданных;
	СтрокаМетаданных.ВидМетаданныхДляПоиска = ВидМетаданных;
	
	Если ВидыПроверок.Количество() Тогда
		Для каждого ВидПроверки из ВидыПроверок Цикл
			
			СтрокаПроверки = СтрокаМетаданных.Строки.Добавить();
			СтрокаПроверки.ВидМетаданныхДляПоиска = ВидМетаданных;
			СтрокаПроверки.ВидПроверкиДляПоиска   = ВидПроверки;
			СтрокаПроверки.ВидПроверки = ВидПроверки;
			
			Для каждого Метаданное из Метаданные[ВидМетаданных] Цикл
				
				СтрокаОбъекта = СтрокаПроверки.Строки.Добавить();
				СтрокаОбъекта.ИмяМетаданного         = Метаданное.Имя;
				СтрокаОбъекта.ВидМетаданныхДляПоиска = ВидМетаданных;
				СтрокаОбъекта.ВидПроверкиДляПоиска   = ВидПроверки;
				

			КонецЦикла;
		КонецЦикла;
	Иначе
		Для каждого Метаданное из Метаданные[ВидМетаданных] Цикл
			СтрокаОбъекта = СтрокаМетаданных.Строки.Добавить();
			СтрокаОбъекта.ВидМетаданныхДляПоиска = ВидМетаданных;
			СтрокаОбъекта.ИмяМетаданного         = Метаданное.Имя;		
		КонецЦикла;
	КонецЕсли;
		
КонецПроцедуры

&НаКлиенте
Процедура СоздатьФайлНастроек(Команда)
	
	ОбработчикОповещения = Новый ОписаниеОповещения("ЗаписатьНастройкуПослеВыбораФайла",ЭтаФорма);
	
	ВыборФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	
	ВыборФайла.Показать(ОбработчикОповещения);
	ВыборФайла.Фильтр = "Файлы JSON (*.json)|*.json";
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаписатьНастройкуПослеВыбораФайла(Результат,ДопПараметры) Экспорт
	
	Если Результат<>Неопределено Тогда
		
		ИмяФайла = Результат[0];
		
		Файл = Новый Файл(ИмяФайла);
		
		ПараметрыЗаписи = Новый ПараметрыЗаписиJSON(,Символы.Таб);
		ЗаписьJSON = Новый ЗаписьJSON;
		
		Если ЗначениеЗаполнено(СтрокаJSON) Тогда
			ЗаписьJSON.УстановитьСтроку(ПараметрыЗаписи);
		Иначе 
			ЗаписьJSON.ОткрытьФайл(ИмяФайла);
		КонецЕсли;
		 	
		ЗаполнитьJSONНастроек(ЗаписьJSON);
			
		Если ЗначениеЗаполнено(СтрокаJSON) Тогда
			ВремСтрокаJSON = ЗаписьJSON.Закрыть();
			
			НастроенноеСоответствие = ПрочитатьСоответствиеИзСтрокиJSON(ВремСтрокаJSON);
		
			СоответствиеИсх = ПрочитатьСоответствиеИзСтрокиJSON(СтрокаJSON);
			
			ДымовоеСоответствиеИсх = СоответствиеИсх[КлючНастройки()];
			ДымовоеСоответствие = НастроенноеСоответствие[КлючНастройки()];
			Если ЗначениеЗаполнено(ДымовоеСоответствие) Тогда
				Если Не ЗначениеЗаполнено(ДымовоеСоответствиеИсх) Тогда
					СоответствиеИсх.Вставить(КлючНастройки(), ДымовоеСоответствие);
				Иначе
					МассивВидов = Новый Массив;
					МассивВидов.Добавить("Справочники");
					МассивВидов.Добавить("Документы");
					МассивВидов.Добавить("Отчеты");
					МассивВидов.Добавить("Обработки");
					Для каждого Вид Из МассивВидов Цикл
						ВремСоответствие = ДымовоеСоответствие[Вид];
						Если ВремСоответствие = Неопределено Тогда
							ДымовоеСоответствиеИсх.Удалить(Вид);
						Иначе	
							ДымовоеСоответствиеИсх.Вставить(Вид, ВремСоответствие);
						КонецЕсли;
					КонецЦикла; 
				КонецЕсли;
				
			КонецЕсли;
		
			ЗаписьJSON = Новый ЗаписьJSON;
			ЗаписьJSON.ОткрытьФайл(ИмяФайла,,,ПараметрыЗаписи);
			ЗаписатьJSON(ЗаписьJSON, СоответствиеИсх);
			ЗаписьJSON.Закрыть();
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьJSONНастроек(ЗаписьJSON)
	
	Настройки = Новый Соответствие;
	
	Для каждого СтрокаМетаданного из ДеревоМетаданных.ПолучитьЭлементы() Цикл
		
		ВидыПроверки = Новый Структура;
		ДобавлятьМетаданное = Истина;
		
		Если СтрокаМетаданного.ВидМетаданных = "Справочники" Или СтрокаМетаданного.ВидМетаданных = "Документы" Тогда		
			//сначала добавляем данные о значениях реквизитов 
			Если СтрокаМетаданного.Исключено Тогда
				ДобавлятьМетаданное = Ложь;
			Иначе
				НастройкаЗаполненияРеквизитов = ПолучитьНастройкуЗаполненияРеквизтов(СтрокаМетаданного.ВидМетаданных);
				
				Если НастройкаЗаполненияРеквизитов.Количество() Тогда
					ВидыПроверки.Вставить("ЗначенияРеквизитовНовых",НастройкаЗаполненияРеквизитов);
				КонецЕсли;
				
				//для справочников и документов есть еще подраздел виды проверки
				Для каждого СтрокаВидаПроверки Из СтрокаМетаданного.ПолучитьЭлементы() Цикл
					
					ДобавлятьВидПроверки = Истина;
					Если СтрокаВидаПроверки.Исключено Тогда
						ДобавлятьВидПроверки = Ложь;
						ВидыПроверки.Вставить(СтрокаВидаПроверки.ВидПроверки, Ложь);
					Иначе
						МетаданныеПроверки = Новый Массив;
						
						Для каждого СтрокаИмяМетаданного из СтрокаВидаПроверки.ПолучитьЭлементы() Цикл
							
							Если СтрокаИмяМетаданного.Исключено Тогда
								МетаданныеПроверки.Добавить(СтрокаИмяМетаданного.ИмяМетаданного);
							КонецЕсли;
							
						КонецЦикла;
						
						Если МетаданныеПроверки.Количество() Тогда
							ВидыПроверки.Вставить(СтрокаВидаПроверки.ВидПроверки,МетаданныеПроверки);
						КонецЕсли;
					КонецЕсли;
					
				КонецЦикла;
			КонецЕсли;
			
		Иначе
			
			МетаданныеПроверки = Новый Массив;
			
			Если СтрокаМетаданного.Исключено Тогда
				ДобавлятьМетаданное = Ложь;
			Иначе
				Для каждого СтрокаИмяМетаданного из СтрокаМетаданного.ПолучитьЭлементы() Цикл
					
					Если СтрокаИмяМетаданного.Исключено Тогда
						МетаданныеПроверки.Добавить(СтрокаИмяМетаданного.ИмяМетаданного);
					КонецЕсли;
					
				КонецЦикла;
			КонецЕсли;
			
			Если МетаданныеПроверки.Количество() Тогда
				ВидыПроверки = МетаданныеПроверки;
			КонецЕсли;
			
		КонецЕсли;
		
		Если ДобавлятьМетаданное Тогда
			Если ВидыПроверки.Количество() Тогда
				Настройки.Вставить(СтрокаМетаданного.ВидМетаданных, ВидыПроверки);
			КонецЕсли;
		Иначе
			Настройки.Вставить(СтрокаМетаданного.ВидМетаданных, Ложь);
		КонецЕсли; 
		
	КонецЦикла;
	
	ЗаписьJSON.ЗаписатьНачалоОбъекта();
	ЗаписьJSON.ЗаписатьИмяСвойства(КлючНастройки());
	ЗаписьJSON.ЗаписатьНачалоОбъекта();
	
	Если Настройки.Количество() Тогда
		Для каждого ЭлементВидаМетаданных из Настройки Цикл
			
			ЗаписьJSON.ЗаписатьИмяСвойства(ЭлементВидаМетаданных.Ключ);
						
			Если ТипЗнч(ЭлементВидаМетаданных.Значение) = Тип("Булево") Тогда
				ЗаписьJSON.ЗаписатьЗначение(Ложь);
				Продолжить;
			ИначеЕсли ТипЗнч(ЭлементВидаМетаданных.Значение) = Тип("Структура") Тогда
				
				ЗаписьJSON.ЗаписатьНачалоОбъекта();

				Для каждого ЭлементПроверки из ЭлементВидаМетаданных.Значение Цикл
					
					ЗаписьJSON.ЗаписатьИмяСвойства(ЭлементПроверки.Ключ);
					
					
					Если ЭлементПроверки.Ключ = "ЗначенияРеквизитовНовых" Тогда
						
						ЗаписьJSON.ЗаписатьНачалоОбъекта();	
						
						Для каждого ОбъектМетаданных из ЭлементПроверки.Значение Цикл
							
							ЗаписьJSON.ЗаписатьИмяСвойства(ОбъектМетаданных.Ключ);	
							
							ЗаписьJSON.ЗаписатьНачалоОбъекта();
							
							Для каждого Реквизит из ОбъектМетаданных.Значение Цикл
								ЗаписьJSON.ЗаписатьИмяСвойства(Реквизит.Ключ);	
								ЗаписьJSON.ЗаписатьЗначение(Реквизит.Значение);
							КонецЦикла;
							ЗаписьJSON.ЗаписатьКонецОбъекта();
						КонецЦикла;
						ЗаписьJSON.ЗаписатьКонецОбъекта();
					Иначе
						Если ТипЗнч(ЭлементПроверки.Значение) = Тип("Булево") Тогда
							ЗаписьJSON.ЗаписатьЗначение(Ложь);
							Продолжить;
						Иначе

							ЗаписьJSON.ЗаписатьНачалоМассива();
							
							Для каждого ОбъектМетаданных из ЭлементПроверки.Значение Цикл
								
								ЗаписьJSON.ЗаписатьЗначение(ОбъектМетаданных);
								
							КонецЦикла;
							
							ЗаписьJSON.ЗаписатьКонецМассива();
						КонецЕсли;
						
					КонецЕсли;
				КонецЦикла;
				
				ЗаписьJSON.ЗаписатьКонецОбъекта();	
				
			Иначе
				
				ЗаписьJSON.ЗаписатьНачалоМассива();
				
				Для каждого ОбъектМетаданных из ЭлементВидаМетаданных.Значение Цикл
					ЗаписьJSON.ЗаписатьЗначение(ОбъектМетаданных);
				КонецЦикла;
				
				ЗаписьJSON.ЗаписатьКонецМассива();
			КонецЕсли;
						
		КонецЦИкла;
		
		ЗаписьJSON.ЗаписатьКонецОбъекта();
		
	КонецЕсли;
	
	ЗаписьJSON.ЗаписатьКонецОбъекта();
	
КонецПроцедуры

&НаСервере
Функция ПолучитьНастройкуЗаполненияРеквизтов(ВидМетаданных)
	
	НастройкаЗаполненияРеквизитов = Новый Структура;
	
	Отбор = Новый Структура("ВидМетаданных", ВидМетаданных);
	
	ТЗ = ЗначенияРеквизитовНовых.Выгрузить(Отбор);
	
	ТЗИменМетаданных = ТЗ.Скопировать();
	ТЗИменМетаданных.Свернуть("ИмяМетаданного");
	
	Для каждого СтрокаМетаданного из ТЗИменМетаданных Цикл
		
		ЗначенияРеквизитов = Новый Структура;
		Отбор = Новый Структура("ИмяМетаданного",СтрокаМетаданного.ИмяМетаданного);
		СтрокиРеквизитов = ТЗ.НайтиСтроки(Отбор);
		
		Для каждого СтрокаРеквзита из СтрокиРеквизитов Цикл
			ЗначенияРеквизитов.Вставить(СтрокаРеквзита.Реквизит,СтрокаРеквзита.ЗначениеРеквизитаСтрокой);
		КонецЦИкла;
		
		НастройкаЗаполненияРеквизитов.Вставить(СтрокаМетаданного.ИмяМетаданного,ЗначенияРеквизитов);
		
	КонецЦикла;
	
	Возврат НастройкаЗаполненияРеквизитов;
	
КонецФункции

&НаКлиенте
Процедура ДеревоМетаданныхВыборПриИзменении(Элемент)
	
	ТекущаяСтрока = Элементы.ДеревоМетаданных.ТекущиеДанные;
	ЗначениеФлажка = ТекущаяСтрока.Исключено;
	ПодчиненныеСтроки = ТекущаяСтрока.ПолучитьЭлементы();
	УстановитьЗначениеВыбораВПодчиненных(ПодчиненныеСтроки,ЗначениеФлажка);
	
КонецПроцедуры

&НаКлиенте
Процедура УстановитьЗначениеВыбораВПодчиненных(ПодчиненныеСтроки,ЗначениеФлажка)
	
	Для каждого Строка из ПодчиненныеСтроки Цикл
		Строка.Исключено = ЗначениеФлажка;
		УстановитьЗначениеВыбораВПодчиненных(Строка.ПолучитьЭлементы(),ЗначениеФлажка);
	КонецЦикла;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗначенияРеквизитовНовыхПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	
	СтрокаДЗ = Элементы.ДеревоМетаданных.ТекущиеДанные;
	ТекущаяСтрока = Элементы.ЗначенияРеквизитовНовых.ТекущиеДанные;
	ТекущаяСтрока.ВидМетаданных = СтрокаДЗ.ВидМетаданныхДляПоиска;
	ТекущаяСтрока.ИмяМетаданного = СтрокаДЗ.ИмяМетаданного;
	
	ЗаполнитьСписокРеквизитов(ТекущаяСтрока); 
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьСписокРеквизитов(ТекущаяСтрока)

	МассивРеквизитов = ПолучитьМассивРеквизитовНаСервере(ТекущаяСтрока.ВидМетаданных,ТекущаяСтрока.ИмяМетаданного); 
	
	Элементы.ЗначенияРеквизитовНовыхРеквизит.СписокВыбора.ЗагрузитьЗначения(МассивРеквизитов);
	
КонецПроцедуры

&НаСервере
Функция ПолучитьМассивРеквизитовНаСервере(ЗНАЧ ВидМетаданных,ЗНАЧ ИмяМетаданного)
	ОбМетаданных = ПолучитьОбъектМетаданных(ВидМетаданных,ИмяМетаданного); 
	
	МассивРеквизитов = Новый Массив;
	
	Для каждого Реквизит Из ОбМетаданных.Реквизиты Цикл
		МассивРеквизитов.Добавить(Реквизит.Имя);
	КонецЦикла;
	
	Для каждого Реквизит Из ОбМетаданных.СтандартныеРеквизиты Цикл
		МассивРеквизитов.Добавить(Реквизит.Имя);
	КонецЦикла;

	Возврат МассивРеквизитов;
	
КонецФункции

&НаКлиенте
Процедура ЗагрузитьФайлНастроек(Команда)
	
	ОбработчикОповещения = Новый ОписаниеОповещения("ЗагрузитьНастройкуПослеВыбораФайла",ЭтаФорма);
	
	ВыборФайла = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Открытие);

	ВыборФайла.Показать(ОбработчикОповещения);
	ВыборФайла.Фильтр = "Файлы JSON (*.json)|*.json";
	
КонецПроцедуры

&НаКлиенте
Процедура ЗагрузитьНастройкуПослеВыбораФайла(Результат,ДопПараметры) Экспорт
	
	Если Результат<>Неопределено Тогда
		
		ИмяФайла = Результат[0];
		
		КоллекцияИсключаемыхКлючей = Новый Соответствие;
		КоллекцияИсключаемыхКлючей.Вставить("$schema", "$schema");	
		
		ЧтениеJSON = Новый ЧтениеJSON;
		ЧтениеJSON.ОткрытьФайл(ИмяФайла);
	
		Соответствие = ПрочитатьJSON(ЧтениеJSON, Истина);
		
		СтрокаJSON = "";
				
		ПараметрыЗаписи = Новый ПараметрыЗаписиJSON(,Символы.Таб);
		ЗаписьJSON = Новый ЗаписьJSON;
		ЗаписьJSON.УстановитьСтроку(ПараметрыЗаписи);
		ЗаписатьJSON(ЗаписьJSON, Соответствие);
		СтрокаJSON = ЗаписьJSON.Закрыть();
		
		Результат = ПреобразоватьСоответствиеВСтруктуру(Соответствие, КоллекцияИсключаемыхКлючей);

		ЗагрузитьФайлНастроекНаСервере(Результат);	
		
		ДеревоМетаданныхПриАктивизацииСтроки(Неопределено);
		
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Функция ПреобразоватьСоответствиеВСтруктуру(Знач Соответствие, Знач КоллекцияИсключаемыхКлючей)
	Результат = Новый Структура;
	Для каждого КлючЗначение Из Соответствие Цикл
		Если КоллекцияИсключаемыхКлючей.Получить(КлючЗначение.Ключ) = Неопределено Тогда
			Значение = КлючЗначение.Значение;
			Если ТипЗнч(Значение) = Тип("Соответствие") Тогда
				Значение = ПреобразоватьСоответствиеВСтруктуру(Значение, КоллекцияИсключаемыхКлючей);
			КонецЕсли;
			Результат.Вставить(КлючЗначение.Ключ, Значение);
		КонецЕсли;
	КонецЦикла;
	Возврат Результат;
КонецФункции

&НаСервере
Процедура ЗагрузитьФайлНастроекНаСервере(Результат)
	
		
	ЗаполнитьДеревоМетаданныхНаСервере();
	
	ДЗ = РеквизитФормыВЗначение("ДеревоМетаданных");

	Попытка
		Настройки = Результат[КлючНастройки()];
		Для каждого Элемент из Настройки Цикл
			ЗагрузитьНастройкиВДерево(ДЗ,Элемент);
		КонецЦикла;
	Исключение
		СообщитьПользователю("Ошибка при загрузке настроек из файла: "+ОписаниеОшибки());
	КонецПопытки;
	
	ЗначениеВРеквизитФормы(ДЗ,"ДеревоМетаданных");
	
КонецПроцедуры

&НаСервере
Процедура ЗагрузитьНастройкиВДерево(ДЗ,Элемент)
	
	//1. Исключаем из проверки формы указанные в файле настроек
	Если Элемент.Ключ = "Документы" Или  Элемент.Ключ = "Справочники" Тогда
		
		Если ТипЗнч(Элемент.Значение) = Тип("Булево") И Элемент.Значение = Ложь Тогда
			Отбор = Новый Структура("ВидМетаданныхДляПоиска", Элемент.Ключ);
			МассивСтрокМетаданного = ДЗ.Строки.НайтиСтроки(Отбор, Ложь);
			Для каждого СтрокаМетаданного из МассивСтрокМетаданного Цикл
				СтрокаМетаданного.Исключено = Истина;
			КонецЦикла;
		Иначе
			Для каждого ПодчЭлемент из Элемент.Значение Цикл
				Если ПодчЭлемент.Ключ <> "ЗначенияРеквизитовНовых" Тогда
					Если ТипЗнч(ПодчЭлемент.Значение) = Тип("Булево") И ПодчЭлемент.Значение = Ложь Тогда
						Отбор = Новый Структура("ВидМетаданныхДляПоиска,ВидПроверкиДляПоиска", Элемент.Ключ, ПодчЭлемент.Ключ);
						МассивСтрокМетаданного = ДЗ.Строки.НайтиСтроки(Отбор,Истина);
						Для каждого СтрокаМетаданного из МассивСтрокМетаданного Цикл
							СтрокаМетаданного.Исключено = Истина;
						КонецЦикла;
					Иначе
						Для каждого Метаданное из ПодчЭлемент.Значение Цикл 
							//ключ - вид проверки, значение массив метаданных
							Отбор = Новый Структура("ВидМетаданныхДляПоиска,ВидПроверкиДляПоиска,ИмяМетаданного", Элемент.Ключ, ПодчЭлемент.Ключ, Метаданное);
							МассивСтрокМетаданного = ДЗ.Строки.НайтиСтроки(Отбор,Истина);
							Для каждого СтрокаМетаданного из МассивСтрокМетаданного Цикл
								СтрокаМетаданного.Исключено = Истина;
							КонецЦикла;
						КонецЦикла;
					КонецЕсли;
					
				Иначе
					
					ВидМетаданных = Элемент.Ключ;
					//заполним таблицу со значениями реквизитов для запролнения
					Для каждого Метаданное из ПодчЭлемент.Значение Цикл
						
						ОбМетаданных = ПолучитьОбъектМетаданных(ВидМетаданных,Метаданное.Ключ);
						
						Для каждого Реквизит из Метаданное.Значение Цикл
							ЗначениеРеквизита = ЗначениеРеквизита(ОбМетаданных,Реквизит.Ключ,Реквизит.Значение);
							СтрокаРеквизита = ЗначенияРеквизитовНовых.Добавить();
							СтрокаРеквизита.ИмяМетаданного           = Метаданное.Ключ;
							СтрокаРеквизита.Реквизит                 = Реквизит.Ключ;
							СтрокаРеквизита.ЗначениеРеквизита        = ЗначениеРеквизита;
							СтрокаРеквизита.ЗначениеРеквизитаСтрокой = Реквизит.Значение;
							СтрокаРеквизита.ВидМетаданных            = ВидМетаданных;
							
						КонецЦикла;
					КонецЦикла;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли; 
		
	ИначеЕсли Элемент.Ключ = "Обработки" Или Элемент.Ключ = "Отчеты" Тогда
		
		Если ТипЗнч(Элемент.Значение) = Тип("Булево") И Элемент.Значение = Ложь Тогда
			Отбор = Новый Структура("ВидМетаданныхДляПоиска", Элемент.Ключ);
			МассивСтрокМетаданного = ДЗ.Строки.НайтиСтроки(Отбор, Ложь);
			Для каждого СтрокаМетаданного из МассивСтрокМетаданного Цикл
				СтрокаМетаданного.Исключено = Истина;
			КонецЦикла;
		Иначе
			//находим строки по виду метаданного
			Отбор = Новый Структура("ВидМетаданных",Элемент.Ключ);
			МассивСтрокВидовМетаданных = ДЗ.Строки.НайтиСтроки(Отбор);
			
			Для каждого Метаданное из Элемент.Значение Цикл
				
				Отбор = Новый Структура("ВидМетаданныхДляПоиска,ИмяМетаданного",Элемент.Ключ,Метаданное);
				МассивСтрокМетаданного = ДЗ.Строки.НайтиСтроки(Отбор,Истина);
				
				Для каждого СтрокаМетаданного из МассивСтрокМетаданного Цикл
					СтрокаМетаданного.Исключено = Истина;
				КонецЦикла;
				
			КонецЦикла;
		КонецЕсли;
		
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Функция ПолучитьОбъектМетаданных(ВидМетаданных,ИмяМетаданного)
	
	ПолноеИмяМетаданного = Лев(ВидМетаданных,СтрДлина(ВидМетаданных)-1)+"."+ИмяМетаданного;
	ОбМетаданных = Метаданные.НайтиПоПолномуИмени(ПолноеИмяМетаданного);
	
	Возврат ОбМетаданных;
	
КонецФункции

&НаСервере
Функция ЗначениеРеквизита(МетаданныеОбъекта, ИмяРеквизита, ЗначениеРеквизитаИзФайла)

	//Плевако Е. добавил попытку для возможности указания значений стандартных реквизитов 
	ЭтоСтандартныйРеквизит = Ложь;
	Попытка	
		ТипРеквизита = МетаданныеОбъекта.Реквизиты[ИмяРеквизита].Тип.Типы()[0];
	Исключение
		ТипРеквизита = МетаданныеОбъекта.СтандартныеРеквизиты[ИмяРеквизита].Тип.Типы()[0];
		ЭтоСтандартныйРеквизит = Истина;
	КонецПопытки;

	Если ЭтоПримитивныйТипДанных(ТипРеквизита) Тогда
		Если ЭтоСтандартныйРеквизит Тогда
			Возврат МетаданныеОбъекта.СтандартныеРеквизиты[ИмяРеквизита].Тип.ПривестиЗначение(ЗначениеРеквизитаИзФайла);
		Иначе
			Возврат МетаданныеОбъекта.Реквизиты[ИмяРеквизита].Тип.ПривестиЗначение(ЗначениеРеквизитаИзФайла);
		КонецЕсли;
	КонецЕсли;

	// Значит, это ссылочный тип данных.
	Попытка
		МетаданныеЗначения = Метаданные.НайтиПоТипу(ТипРеквизита);
		Если Метаданные.Справочники.Содержит(МетаданныеЗначения) Тогда
			Возврат Справочники[МетаданныеЗначения.Имя].НайтиПоНаименованию(ЗначениеРеквизитаИзФайла,Истина);
		ИначеЕсли Метаданные.Перечисления.Содержит(МетаданныеЗначения) Тогда
			Возврат Перечисления[МетаданныеЗначения.Имя][ЗначениеРеквизитаИзФайла];
		КонецЕсли;
		// TODO: поддержку документов и других ссылочных типов данных (добавим по необходимости)
	Исключение
	КонецПопытки;

	Возврат Неопределено;

КонецФункции

&НаСервере
Функция ЭтоПримитивныйТипДанных(Тип)
	Возврат Тип = Тип("Строка") Или Тип = Тип("Число")
		Или Тип = Тип("Дата") Или Тип = Тип("Булево");
КонецФункции

&НаКлиенте
Процедура ДеревоМетаданныхПриАктивизацииСтроки(Элемент)
	
	СтрокаДЗ = Элементы.ДеревоМетаданных.ТекущиеДанные;
	
	Если СтрокаДЗ<>Неопределено Тогда
		Отбор = Новый ФиксированнаяСтруктура(Новый Структура("ВидМетаданных,ИмяМетаданного",СтрокаДЗ.ВидМетаданныхДляПоиска,СтрокаДЗ.ИмяМетаданного));
		Элементы.ЗначенияРеквизитовНовых.ОтборСтрок = Отбор;	
	Иначе
		Отбор = Новый ФиксированнаяСтруктура(Новый Структура("ВидМетаданных,ИмяМетаданного","",""));
		Элементы.ЗначенияРеквизитовНовых.ОтборСтрок = Отбор;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗначенияРеквизитовНовыхПередНачаломДобавления(Элемент, Отказ, Копирование, Родитель, Группа, Параметр)
	СтрокаДЗ = Элементы.ДеревоМетаданных.ТекущиеДанные;
	Если Не ЗначениеЗаполнено(СтрокаДЗ.ИмяМетаданного) ТОгда
		СообщитьПользователю("Выберите объект метаданных, для добавления значений реквизитов", Отказ);
	ИначеЕсли СтрокаДЗ.ВидМетаданныхДляПоиска<>"Справочники" И СтрокаДЗ.ВидМетаданныхДляПоиска<>"Документы" Тогда
		СообщитьПользователю("Данная настройка доступна только для справочников или документов", Отказ);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ЗначенияРеквизитовНовыхРеквизитПриИзменении(Элемент)
	
	ТекущаяСтрока = Элементы.ЗначенияРеквизитовНовых.ТекущиеДанные;
	
	УстановитьТипПоляВСтроке(ТекущаяСтрока);
			
КонецПроцедуры

&НаКлиенте
Процедура УстановитьТипПоляВСтроке(ТекущаяСтрока)
	
	Элементы.ЗначенияРеквизитовНовыхЗначениеРеквизита.ОграничениеТипа = ПолучитьОписаниеТиповРеквизита(ТекущаяСтрока.ВидМетаданных,ТекущаяСтрока.ИмяМетаданного,ТекущаяСтрока.Реквизит);
	
КонецПроцедуры

&НаСервере
Функция ПолучитьОписаниеТиповРеквизита(ВидМетаданных,ИмяМетаданного,ИмяРеквизита)
	
	ОбМетаданных = ПолучитьОбъектМетаданных(ВидМетаданных,ИмяМетаданного);
	
	Попытка	
		ТипРеквизита = ОбМетаданных.Реквизиты[ИмяРеквизита].Тип;
	Исключение
		ТипРеквизита = ОбМетаданных.СтандартныеРеквизиты[ИмяРеквизита].Тип;
	КонецПопытки;

	Возврат ТипРеквизита;
	
КонецФункции


&НаСервере
Процедура ЗначенияРеквизитовНовыхЗначениеРеквизитаПриИзмененииНаСервере()
	
	СтрокаТЗ = ЗначенияРеквизитовНовых.НайтиПоИдентификатору(Элементы.ЗначенияРеквизитовНовых.ТекущаяСтрока);
	ЗначениеРеквизита = СтрокаТЗ.ЗначениеРеквизита;
	
	ТипРеквизита = ТипЗнч(ЗначениеРеквизита);
	
	Если ЭтоПримитивныйТипДанных(ТипРеквизита) Тогда
		СтрокаТЗ.ЗначениеРеквизитаСтрокой = ЗначениеРеквизита;
		Возврат;
	КонецЕсли;
	
	МетаданныеЗначения = Метаданные.НайтиПоТипу(ТипРеквизита);
	Если Метаданные.Справочники.Содержит(МетаданныеЗначения) Тогда
		СтрокаТЗ.ЗначениеРеквизитаСтрокой = ЗначениеРеквизитаОбъекта(ЗначениеРеквизита,"Наименование");
	ИначеЕсли Метаданные.Перечисления.Содержит(МетаданныеЗначения) Тогда
		Для каждого ЭлементПеречисления из МетаданныеЗначения.ЗначенияПеречисления Цикл
			Если ЭлементПеречисления.Синоним = Строка(ЗначениеРеквизита) Тогда
				СтрокаТЗ.ЗначениеРеквизитаСтрокой = ЭлементПеречисления.Имя;
			КонецЕсли;
		КонецЦикла;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ЗначенияРеквизитовНовыхЗначениеРеквизитаПриИзменении(Элемент)
	ЗначенияРеквизитовНовыхЗначениеРеквизитаПриИзмененииНаСервере();
КонецПроцедуры

&НаКлиентеНаСервереБезКонтекста
Процедура СообщитьПользователю(Знач Сообщение, Отказ = Ложь)
	Сообщить(Сообщение);	
	Отказ = Истина;
КонецПроцедуры

#область ФункцииДляСовместимости

// Возвращает структуру, содержащую значения реквизитов прочитанные из информационной базы
// по ссылке на объект.
// 
//  Если доступа к одному из реквизитов нет, то в случае "ВыбратьРазрешенные = Ложь" возникнет исключение прав доступа,
//  а в случае "ВыбратьРазрешенные = Истина" вернется значение Неопределено для всех реквизитов.
//
//  Если необходимо зачитать реквизит независимо от прав текущего пользователя,
//  то следует использовать предварительный переход в привилегированный режим.
// 
// Функция не предназначена для получения значений реквизитов пустых ссылок.
//
// Параметры:
//  Ссылка    - ЛюбаяСсылка - объект, значения реквизитов которого необходимо получить.
//
//  Реквизиты - Строка - имена реквизитов, перечисленные через запятую, в формате
//              требований к свойствам структуры.
//              Например, "Код, Наименование, Родитель".
//            - Структура, ФиксированнаяСтруктура - в качестве ключа передается
//              псевдоним поля для возвращаемой структуры с результатом, а в качестве
//              значения (опционально) фактическое имя поля в таблице.
//              Если значение не определено, то имя поля берется из ключа.
//            - Массив, ФиксированныйМассив - имена реквизитов в формате требований
//              к свойствам структуры.
//
//  ВыбратьРазрешенные - Булево - если Истина, то запрос к объекту выполняется с учетом прав пользователя, и в случае,
//                                если выборка будет пустая, то все реквизиты вернутся со значением Неопределено;
//                                если Ложь, то возникнет исключение при отсутствии прав на любой из реквизитов.
//
// Возвращаемое значение:
//  Структура - содержит имена (ключи) и значения затребованных реквизитов.
//              Если строка затребованных реквизитов пуста, то возвращается пустая структура.
//              Если в качестве объекта передана пустая ссылка, то все реквизиты вернутся со значением Неопределено.
//
&НаСервере
Функция ЗначенияРеквизитовОбъекта(Ссылка, Знач Реквизиты, ВыбратьРазрешенные = Ложь) Экспорт
	
	Если ТипЗнч(Реквизиты) = Тип("Строка") Тогда
		Если ПустаяСтрока(Реквизиты) Тогда
			Возврат Новый Структура;
		КонецЕсли;
		Реквизиты = РазложитьСтрокуВМассивПодстрок(Реквизиты, ",", Ложь);
	КонецЕсли;
	
	СтруктураРеквизитов = Новый Структура;
	Если ТипЗнч(Реквизиты) = Тип("Структура") Или ТипЗнч(Реквизиты) = Тип("ФиксированнаяСтруктура") Тогда
		СтруктураРеквизитов = Реквизиты;
	ИначеЕсли ТипЗнч(Реквизиты) = Тип("Массив") Или ТипЗнч(Реквизиты) = Тип("ФиксированныйМассив") Тогда
		Для Каждого Реквизит Из Реквизиты Цикл
			СтруктураРеквизитов.Вставить(СтрЗаменить(Реквизит, ".", ""), Реквизит);
		КонецЦикла;
	Иначе
		ВызватьИсключение ПодставитьПараметрыВСтроку(НСтр("ru='Неверный тип второго параметра Реквизиты: %1';en='Wrong type second parameter Реквизиты: %1'"), Строка(ТипЗнч(Реквизиты)));
	КонецЕсли;
	
	ТекстПолей = "";
	Для Каждого КлючИЗначение Из СтруктураРеквизитов Цикл
		ИмяПоля   = ?(ЗначениеЗаполнено(КлючИЗначение.Значение),
		              СокрЛП(КлючИЗначение.Значение),
		              СокрЛП(КлючИЗначение.Ключ));
		
		Псевдоним = СокрЛП(КлючИЗначение.Ключ);
		
		ТекстПолей  = ТекстПолей + ?(ПустаяСтрока(ТекстПолей), "", ",") + "
		|	" + ИмяПоля + " КАК " + Псевдоним;
	КонецЦикла;
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	Запрос.Текст =
	"ВЫБРАТЬ " + ?(ВыбратьРазрешенные, "РАЗРЕШЕННЫЕ", "") + "
	|" + ТекстПолей + "
	|ИЗ
	|	" + Ссылка.Метаданные().ПолноеИмя() + " КАК ПсевдонимЗаданнойТаблицы
	|ГДЕ
	|	ПсевдонимЗаданнойТаблицы.Ссылка = &Ссылка
	|";
	Выборка = Запрос.Выполнить().Выбрать();
	
	Результат = Новый Структура;
	Для Каждого КлючИЗначение Из СтруктураРеквизитов Цикл
		Результат.Вставить(КлючИЗначение.Ключ);
	КонецЦикла;
	
	Если Выборка.Следующий() Тогда
		ЗаполнитьЗначенияСвойств(Результат, Выборка);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции

// Возвращает значение реквизита, прочитанного из информационной базы по ссылке на объект.
// 
//  Если доступа к реквизиту нет, то в случае "ВыбратьРазрешенные = Ложь" возникнет исключение прав доступа,
//  а в случае "ВыбратьРазрешенные = Истина" вернется значение Неопределено.
//
//  Если необходимо зачитать реквизит независимо от прав текущего пользователя,
//  то следует использовать предварительный переход в привилегированный режим.
//
// Функция не предназначена для получения значений реквизитов пустых ссылок.
// 
// Параметры:
//  Ссылка    - ЛюбаяСсылка - объект, значения реквизитов которого необходимо получить.
//  ИмяРеквизита - Строка - имя получаемого реквизита.
//  ВыбратьРазрешенные - Булево - если Истина, то запрос к объекту выполняется с учетом прав пользователя, и в случае,
//                                если выборка будет пустая, то вернется значение Неопределено.
// 
// Возвращаемое значение:
//  Произвольный - зависит от типа значения прочитанного реквизита.
// 
&НаСервере
Функция ЗначениеРеквизитаОбъекта(Ссылка, ИмяРеквизита, ВыбратьРазрешенные = Ложь) Экспорт
	
	Результат = ЗначенияРеквизитовОбъекта(Ссылка, ИмяРеквизита, ВыбратьРазрешенные);
	Возврат Результат[СтрЗаменить(ИмяРеквизита, ".", "")];
	
КонецФункции 

// Возвращает значения реквизитов, прочитанные из информационной базы
// для нескольких объектов.
// 
//  Если доступа к одному из реквизитов какого-либо объекта нет, то в случае "ВыбратьРазрешенные = Ложь" возникнет
//  исключение прав доступа, а в случае "ВыбратьРазрешенные = Истина" вернется значение Неопределено для всех
//  реквизитов этого объекта.
//
//  Если необходимо зачитать реквизит независимо от прав текущего пользователя,
//  то следует использовать предварительный переход в привилегированный режим.
//
// Функция не предназначена для получения значений реквизитов пустых ссылок.
// 
// Параметры:
//  МассивСсылок - Массив - массив ссылок на объекты одного типа.
//                 ВАЖНО! Значения массива должны быть ссылками на объекты ОДНОГО типа!
//  ИменаРеквизитов - Строка - имена реквизитов перечисленные через запятую, в формате требований к свойствам структуры.
//                             Например, "Код, Наименование, Родитель".
// 
//  ВыбратьРазрешенные - Булево - если Истина, то запрос к объектам выполняется с учетом прав пользователя, и в случае,
//                                если какой-либо объект будет исключен из выборки по правам, то все реквизиты этого объекта
//                                вернутся со значением Неопределено;
//                                если Ложь, то возникнет исключение при отсутствии прав на любой из реквизитов любого
//                                из объектов.
// Возвращаемое значение:
//  Соответствие - список объектов и значений их реквизитов:
//   * Ключ - ЛюбаяСсылка - ссылка на объект;
//   * Значение - Структура - значения реквизитов:
//    ** Ключ - Строка - имя реквизита;
//    ** Значение - Произвольный - значение реквизита.
// 
&НаСервере
Функция ЗначенияРеквизитовОбъектов(МассивСсылок, ИменаРеквизитов, ВыбратьРазрешенные = Ложь) Экспорт
	
	ЗначенияРеквизитов = Новый Соответствие;
	Если МассивСсылок.Количество() = 0 Тогда
		Возврат ЗначенияРеквизитов;
	КонецЕсли;
	
	Запрос = Новый Запрос;
	Запрос.Текст =
		"ВЫБРАТЬ " + ?(ВыбратьРазрешенные, "РАЗРЕШЕННЫЕ", "") + "
		|	Ссылка КАК Ссылка, " + ИменаРеквизитов + "
		|ИЗ
		|	" + МассивСсылок[0].Метаданные().ПолноеИмя() + " КАК Таблица
		|ГДЕ
		|	Таблица.Ссылка В (&МассивСсылок)";
	Запрос.УстановитьПараметр("МассивСсылок", МассивСсылок);
	Выборка = Запрос.Выполнить().Выбрать();
	
	Для Каждого Ссылка Из МассивСсылок Цикл
		ЗначенияРеквизитов.Вставить(Ссылка, Новый Структура(ИменаРеквизитов));
	КонецЦикла;
	
	Пока Выборка.Следующий() Цикл
		ЗаполнитьЗначенияСвойств(ЗначенияРеквизитов[Выборка.Ссылка], Выборка);
	КонецЦикла;
	
	Возврат ЗначенияРеквизитов;
	
КонецФункции


// Преобразует строку таблицы значений в структуру.
// Свойства структуры и их значения совпадают с колонками переданной строки.
//
// Параметры:
//  СтрокаТаблицыЗначений - СтрокаТаблицыЗначений - строка таблицы значений.
//
// Возвращаемое значение:
//  Структура - преобразованная строка таблицы значений.
//
&НаСервере
Функция СтрокаТаблицыЗначенийВСтруктуру(СтрокаТаблицыЗначений) Экспорт
	
	Структура = Новый Структура;
	Для каждого Колонка Из СтрокаТаблицыЗначений.Владелец().Колонки Цикл
		Структура.Вставить(Колонка.Имя, СтрокаТаблицыЗначений[Колонка.Имя]);
	КонецЦикла;
	
	Возврат Структура;
	
КонецФункции

// Подставляет параметры в строку. Максимально возможное число параметров - 9.
// Параметры в строке задаются как %<номер параметра>. Нумерация параметров начинается с единицы.
//
// Параметры:
//  ШаблонСтроки  - Строка - шаблон строки с параметрами (вхождениями вида "%<номер параметра>", 
//                           например, "%1 пошел в %2");
//  Параметр<n>   - Строка - значение подставляемого параметра.
//
// Возвращаемое значение:
//  Строка   - текстовая строка с подставленными параметрами.
//
// Пример:
//  СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(НСтр("ru='%1 пошел в %2'"), "Вася", "Зоопарк") = "Вася пошел
//  в Зоопарк".
//
&НаСервере
Функция ПодставитьПараметрыВСтроку(Знач ШаблонСтроки,
	Знач Параметр1, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
	Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
	Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено) Экспорт
	
	ЕстьПараметрыСПроцентом = Найти(Параметр1, "%") > 0
		Или Найти(Параметр2, "%") > 0
		Или Найти(Параметр3, "%") > 0
		Или Найти(Параметр4, "%") > 0
		Или Найти(Параметр5, "%") > 0
		Или Найти(Параметр6, "%") > 0
		Или Найти(Параметр7, "%") > 0
		Или Найти(Параметр8, "%") > 0
		Или Найти(Параметр9, "%") > 0;
		
	Если ЕстьПараметрыСПроцентом Тогда
		Возврат ПодставитьПараметрыСПроцентом(ШаблонСтроки, Параметр1,
			Параметр2, Параметр3, Параметр4, Параметр5, Параметр6, Параметр7, Параметр8, Параметр9);
	КонецЕсли;
	
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%1", Параметр1);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%2", Параметр2);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%3", Параметр3);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%4", Параметр4);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%5", Параметр5);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%6", Параметр6);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%7", Параметр7);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%8", Параметр8);
	ШаблонСтроки = СтрЗаменить(ШаблонСтроки, "%9", Параметр9);
	Возврат ШаблонСтроки;
	
КонецФункции

// Вставляет параметры в строку, учитывая, что в параметрах могут использоваться подстановочные слова %1, %2 и т.д.
&НаСервере
Функция ПодставитьПараметрыСПроцентом(Знач СтрокаПодстановки,
	Знач Параметр1, Знач Параметр2 = Неопределено, Знач Параметр3 = Неопределено,
	Знач Параметр4 = Неопределено, Знач Параметр5 = Неопределено, Знач Параметр6 = Неопределено,
	Знач Параметр7 = Неопределено, Знач Параметр8 = Неопределено, Знач Параметр9 = Неопределено)
	
	Результат = "";
	Позиция = Найти(СтрокаПодстановки, "%");
	Пока Позиция > 0 Цикл 
		Результат = Результат + Лев(СтрокаПодстановки, Позиция - 1);
		СимволПослеПроцента = Сред(СтрокаПодстановки, Позиция + 1, 1);
		ПодставляемыйПараметр = "";
		Если СимволПослеПроцента = "1" Тогда
			ПодставляемыйПараметр =  Параметр1;
		ИначеЕсли СимволПослеПроцента = "2" Тогда
			ПодставляемыйПараметр =  Параметр2;
		ИначеЕсли СимволПослеПроцента = "3" Тогда
			ПодставляемыйПараметр =  Параметр3;
		ИначеЕсли СимволПослеПроцента = "4" Тогда
			ПодставляемыйПараметр =  Параметр4;
		ИначеЕсли СимволПослеПроцента = "5" Тогда
			ПодставляемыйПараметр =  Параметр5;
		ИначеЕсли СимволПослеПроцента = "6" Тогда
			ПодставляемыйПараметр =  Параметр6;
		ИначеЕсли СимволПослеПроцента = "7" Тогда
			ПодставляемыйПараметр =  Параметр7
		ИначеЕсли СимволПослеПроцента = "8" Тогда
			ПодставляемыйПараметр =  Параметр8;
		ИначеЕсли СимволПослеПроцента = "9" Тогда
			ПодставляемыйПараметр =  Параметр9;
		КонецЕсли;
		Если ПодставляемыйПараметр = "" Тогда
			Результат = Результат + "%";
			СтрокаПодстановки = Сред(СтрокаПодстановки, Позиция + 1);
		Иначе
			Результат = Результат + ПодставляемыйПараметр;
			СтрокаПодстановки = Сред(СтрокаПодстановки, Позиция + 2);
		КонецЕсли;
		Позиция = Найти(СтрокаПодстановки, "%");
	КонецЦикла;
	Результат = Результат + СтрокаПодстановки;
	
	Возврат Результат;
КонецФункции

&НаСервере
Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено) Экспорт
	
	Результат = Новый Массив;
	
	// для обеспечения обратной совместимости
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда 
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;
		
	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Результат.Добавить(Подстрока);
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;
	
	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Результат.Добавить(Строка);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции 

#КонецОбласти

//
&НаКлиенте
Функция ПрочитатьСоответствиеИзСтрокиJSON(Знач ИсхСтрока) 
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(ИсхСтрока);
	
	НастроенноеСоответствие = ПрочитатьJSON(ЧтениеJSON, Истина);
		
	Возврат НастроенноеСоответствие;
	
КонецФункции
 
//
&НаКлиентеНаСервереБезКонтекста
Функция КлючНастройки() 
		
	Возврат "smoke";
	
КонецФункции
 
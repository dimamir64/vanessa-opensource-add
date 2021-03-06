Перем КонтекстЯдра;
Перем Ожидаем;

Перем ФайлОтчета;

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
КонецПроцедуры

Функция ПолучитьСписокТестов() Экспорт
	ВсеТесты = Новый Массив;
	ВсеТесты.Добавить("ТестДолжен_СоздатьОтчет");
	ВсеТесты.Добавить("ТестДолжен_Экспортировать_ОтчетОТестировании");
	
	Возврат ВсеТесты;
КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	Если ФайлОтчета <> Неопределено Тогда
		УдалитьФайлы(ФайлОтчета.ПолноеИмя);
	КонецЕсли;
КонецПроцедуры

Процедура ТестДолжен_СоздатьОтчет() Экспорт
	РезультатТестирования = ПодготовитьРезультатТестирования();
	
	ГенераторОтчета = КонтекстЯдра.Плагин("ГенераторОтчетаJUnitXML");
	Отчет = ГенераторОтчета.СоздатьОтчет(КонтекстЯдра, РезультатТестирования);
	
	Ожидаем.Что(Отчет).ИмеетТип("ТекстовыйДокумент");
	ТекстОтчета = ПолучитьТекстОтчета(Отчет);
	
	Эталон_ОтчетОТестировании = ПолучитьМакет("Эталон_ОтчетОТестировании");
	ТекстЭталона = ПолучитьТекстОтчета(Эталон_ОтчетОТестировании);
	
	Ожидаем.Что(ТекстОтчета).Равно(ТекстЭталона);
КонецПроцедуры

Функция ПодготовитьРезультатТестирования()
	ПостроительДереваТестов = КонтекстЯдра.Плагин("ПостроительДереваТестов");
	УспешныйЭлемент = ПостроительДереваТестов.СоздатьЭлемент(ЭтотОбъект.ИспользуемоеИмяФайла, "УспешныйМетод");
	ЭлементПадающийПоУтверждению = ПостроительДереваТестов.СоздатьЭлемент(ЭтотОбъект.ИспользуемоеИмяФайла, "МетодПадающийПоУтверждению");
	ЭлементПадающийПоНеизвестнойОшибке = ПостроительДереваТестов.СоздатьЭлемент(ЭтотОбъект.ИспользуемоеИмяФайла, "МетодПадающийПоНеизвестнойОшибке");
	ОтсутствующийЭлемент = ПостроительДереваТестов.СоздатьЭлемент(ЭтотОбъект.ИспользуемоеИмяФайла, "ОтсутствующийМетод", "Отсутствующий метод");
	
	Контейнер = ПостроительДереваТестов.СоздатьКонтейнер("Контейнер");
	Контейнер.Строки.Добавить(УспешныйЭлемент);
	Контейнер.Строки.Добавить(ЭлементПадающийПоУтверждению);
	Контейнер.Строки.Добавить(ЭлементПадающийПоНеизвестнойОшибке);
	Контейнер.Строки.Добавить(ОтсутствующийЭлемент);
	
	РезультатТестирования = КонтекстЯдра.ВыполнитьТесты(ЗагрузчикЗаглушка(), Контейнер);
	
	РезультатТестирования.ВремяВыполнения = 0; // для упрощения сравнения не учитываю время выполнения, т.к. оно всегда разное
	
	Возврат РезультатТестирования;
КонецФункции

Функция УбратьИзСтрокиТабуляцииИПереносыСтрок(Знач Результат)
	Результат = СтрЗаменить(Результат, Символы.Таб, "");
	Результат = СтрЗаменить(Результат, Символы.ПС, "");
	
	Возврат Результат;
КонецФункции

Процедура ТестДолжен_Экспортировать_ОтчетОТестировании() Экспорт
	РезультатТестирования = ПодготовитьРезультатТестирования();
	
	ГенераторОтчета = КонтекстЯдра.Плагин("ГенераторОтчетаJUnitXML");
	Отчет = ГенераторОтчета.СоздатьОтчет(КонтекстЯдра, РезультатТестирования);
	
	ИмяФайла = ПолучитьИмяВременногоФайла("xml");
	ФайлОтчета = Новый Файл(ИмяФайла);
	ГенераторОтчета.Экспортировать(Отчет, ФайлОтчета.ПолноеИмя);
	
	Ожидаем.Что(ФайлОтчета.Существует()).ЭтоИстина();
	
	ТекстовыйДокумент = Новый ТекстовыйДокумент;
	ТекстовыйДокумент.Прочитать(ФайлОтчета.ПолноеИмя);
	ТекстОтчета = ПолучитьТекстОтчета(ТекстовыйДокумент);
	
	Эталон_ОтчетОТестировании = ПолучитьМакет("Эталон_ОтчетОТестировании");
	ТекстЭталона = ПолучитьТекстОтчета(Эталон_ОтчетОТестировании);
	
	Ожидаем.Что(ТекстОтчета).Равно(ТекстЭталона);
КонецПроцедуры

Функция ПолучитьТекстОтчета(ТекстовыйДокумент)
	ТекстОтчета = ТекстовыйДокумент.ПолучитьСтроку(1) + Символы.ПС + ТекстовыйДокумент.ПолучитьСтроку(2);
	ТекстОтчета = УбратьИзСтрокиТабуляцииИПереносыСтрок(ТекстОтчета);
	Возврат ТекстОтчета;
КонецФункции

// Методы нужные для тестов
Функция ЗагрузчикЗаглушка()
	Возврат ЭтотОбъект;
КонецФункции

Функция ПолучитьКонтекстПоПути(КонтекстЯдра, Путь) Экспорт
	Возврат ЭтотОбъект;
КонецФункции

Процедура УспешныйМетод() Экспорт
КонецПроцедуры

Процедура МетодПадающийПоУтверждению() Экспорт
	КонтекстЯдра.ВызватьОшибкуПроверки("БАБАХ!!!");
КонецПроцедуры

Процедура МетодПадающийПоНеизвестнойОшибке() Экспорт
	ВызватьИсключение "Ошибка!!!";
КонецПроцедуры

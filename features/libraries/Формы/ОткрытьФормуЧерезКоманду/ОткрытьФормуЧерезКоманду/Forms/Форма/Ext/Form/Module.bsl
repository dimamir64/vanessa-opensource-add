
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-ADD
Перем Ванесса;

&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;

&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-ADD.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;

	ВсеТесты = Новый Массив;

	//описание параметров
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(МассивТестов, Снипет, ИмяПроцедуры,ПредставлениеТеста = Неопределено,ОписаниеШага = Неопределено,ТипШагаДляОписания = Неопределено,ТипШагаВДереве = Неопределено);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуОбработки(Парам01)","ЯОткрываюОсновнуюФормуОбработки",
		"Дано Я открываю основную форму обработки ""Обработка1""",
		"Открывает форму обработки по её имени в метаданных",
		"UI.Формы.Открыть форму объекта");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуОтчета(Парам01)","ЯОткрываюОсновнуюФормуОтчета",
		"Дано Я открываю основную форму отчета ""Отчет1""","Открывает форму отчета по его имени в метаданных",
		"UI.Формы.Открыть форму объекта");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуСпискаСправочника(Парам01)","ЯОткрываюОсновнуюФормуСпискаСправочника",
		"Дано Я открываю основную форму списка справочника ""Справочник1""",
		"Открывает основную форму списка справочника по его имени в метаданных",
		"UI.Формы.Открыть форму объекта");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуСпискаДокумента(Парам01)","ЯОткрываюОсновнуюФормуСпискаДокумента",
		"Дано Я открываю основную форму списка документа ""Документ1""",
		"Открывает основную форму списка документа по его имени в метаданных",
		"UI.Формы.Открыть форму объекта");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуРегистраНакопления(Парам01)","ЯОткрываюОсновнуюФормуРегистраНакопления",
		"Дано Я открываю основную форму регистра накопления ""РегистрНакопления1""",
		"Открывает основную форму регистра накопления по его имени в метаданных",
		"UI.Формы.Открыть форму объекта");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуРегистраСведений(Парам01)","ЯОткрываюОсновнуюФормуРегистраСведений",
		"Дано Я открываю основную форму регистра сведений ""РегистрСведений1""",
		"Открывает основную форму регистра сведений по его имени в метаданных",
		"UI.Формы.Открыть форму объекта");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюОсновнуюФормуСпискаПланаВидовХарактеристик(Парам01)","ЯОткрываюОсновнуюФормуСпискаПланаВидовХарактеристик",
		"Дано Я открываю основную форму списка плана видов характеристик ""ПланВидовХарактеристик1""",
		"Открывает основную форму списка плана видов характеристик по его имени в метаданных",
		"UI.Формы.Открыть форму объекта");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюНавигационнуюСсылку(Парам01)","ЯОткрываюНавигационнуюСсылку",
		"Дано Я открываю навигационную ссылку ""e1cib/data/Справочник.Справочник1?ref=ad018df0619b11d5458a440b8c472f30""",
		"Открывает навигационную ссылку. Аналог Shift+F11",
		"UI.Формы.Открыть форму объекта");

	Возврат ВсеТесты;
КонецФункции

&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции

&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт

КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт

КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Дано Я открываю основную форму обработки "ВыполнитьПроизвольноеВыражение"
//@ЯОткрываюОсновнуюФормуОбработки(Парам01)
Процедура ЯОткрываюОсновнуюФормуОбработки(ИмяОбъекта) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду("e1cib/app/Обработка." + ИмяОбъекта);
КонецПроцедуры

&НаКлиенте
//Дано Я открываю основную форму отчета "ВыполнитьПроизвольноеВыражение"
//@ЯОткрываюОсновнуюФормуОтчета(Парам01)
Процедура ЯОткрываюОсновнуюФормуОтчета(ИмяОбъекта) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду("e1cib/app/Отчет." + ИмяОбъекта);
КонецПроцедуры

&НаКлиенте
//Дано Я открываю основную форму списка справочника "Справочник1"
//@ЯОткрываюОсновнуюФормуСпискаСправочника(Парам01)
Процедура ЯОткрываюОсновнуюФормуСпискаСправочника(ИмяОбъекта) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду("e1cib/list/Справочник." + ИмяОбъекта);
КонецПроцедуры

&НаКлиенте
//Дано Я открываю основную форму списка документа "Документ1"
//@ЯОткрываюОсновнуюФормуСпискаДокумента(Парам01)
Процедура ЯОткрываюОсновнуюФормуСпискаДокумента(ИмяОбъекта) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду("e1cib/list/Документ." + ИмяОбъекта);
КонецПроцедуры

&НаКлиенте
//Дано Я открываю основную форму регистра накопления "РегистрНакопления1"
//@ЯОткрываюОсновнуюФормуРегистраНакопления(Парам01)
Процедура ЯОткрываюОсновнуюФормуРегистраНакопления(ИмяОбъекта) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду("e1cib/list/РегистрНакопления." + ИмяОбъекта);
КонецПроцедуры

&НаКлиенте
//Дано Я открываю основную форму регистра сведений "РегистрСведений1"
//@ЯОткрываюОсновнуюФормуРегистраСведений(Парам01)
Процедура ЯОткрываюОсновнуюФормуРегистраСведений(ИмяОбъекта) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду("e1cib/list/РегистрСведений." + ИмяОбъекта);
КонецПроцедуры

&НаКлиенте
//Дано Я открываю основную форму списка плана видов характеристик "ПланВидовХарактеристик1"
//@ЯОткрываюОсновнуюФормуСпискаПланаВидовХарактеристик(Парам01)
Процедура ЯОткрываюОсновнуюФормуСпискаПланаВидовХарактеристик(ИмяОбъекта) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду("e1cib/list/ПланВидовХарактеристик." + ИмяОбъекта);
КонецПроцедуры

&НаКлиенте
//Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Справочник1?ref=ad018df0619b11d5458a440b8c472f30"
//@ЯОткрываюНавигационнуюСсылку(Парам01)
Процедура ЯОткрываюНавигационнуюСсылку(Стр) Экспорт
	АктивноеОкно = Ванесса.ПолучитьГлавноеОкноИзТестовоеПриложение();
	АктивноеОкно.ВыполнитьКоманду(Стр);
КонецПроцедуры

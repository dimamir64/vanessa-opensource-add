
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

	// описание шагов
	// пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты, Снипет, ИмяПроцедуры, ПредставлениеТеста, ОписаниеШага, ТипШагаДляОписания, ТипШагаВДереве);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПолучаюПлагин(Парам01)","ЯПолучаюПлагин","Когда я получаю плагин ""УтвержденияBDD""","","Плагины");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПроверяюУтверждениеИзПлагина()","ЯПроверяюУтверждениеИзПлагина","Тогда я проверяю утверждение из плагина","","");

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
//Когда я получаю плагин "УтвержденияBDD"
//@ЯПолучаюПлагин(Парам01)
Процедура ЯПолучаюПлагин(ИмяПлагина) Экспорт
	Плагин = Ванесса.Плагин(ИмяПлагина);
	Ванесса.ПроверитьНеравенство(Неопределено, Плагин, "Ванесса.Плагин(ИмяПлагина) равно Неопределено, что неверно");
КонецПроцедуры

&НаКлиенте
//Тогда я проверяю утверждение из плагина
//@ЯПроверяюУтверждениеИзПлагина()
Процедура ЯПроверяюУтверждениеИзПлагина() Экспорт
	Ожидаем = Ванесса.Плагин("УтвержденияBDD");
	Ожидаем.Что(5, "Равно").Равно(5);
КонецПроцедуры

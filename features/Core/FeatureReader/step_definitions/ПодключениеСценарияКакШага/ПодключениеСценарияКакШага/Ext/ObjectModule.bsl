//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
///////////////////////////////////////////////////

// контекст фреймворка Vanessa-ADD
Перем Ванесса;

// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;

	ВсеТесты = Новый Массив;

	// описание шагов
	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВызвалОбычныйШагСценария()","ЯВызвалОбычныйШагСценария","Когда я вызвал обычный шаг сценария");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВКонтекстеЕстьЗначение(Парам01)","ВКонтекстеЕстьЗначение","Тогда в Контексте есть значение ""БылВызванСценарийИзСоседнейФичи""");

	Возврат ВсеТесты;
КонецФункции

// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	Возврат ПолучитьМакет(ИмяМакета);
КонецФункции

// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции

///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	//чтобы сценарий падал на этапе разработки
	Ванесса.ПроверитьРавенство(Контекст.Свойство("БылВызванСценарийИзСоседнейФичи"),Истина,"Ожидали, что в Контекст есть свойство БылВызванСценарийИзСоседнейФичи");
КонецПроцедуры

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

//Когда я вызвал обычный шаг сценария
//@ЯВызвалОбычныйШагСценария()
Процедура ЯВызвалОбычныйШагСценария() Экспорт

КонецПроцедуры

//Тогда в Контексте есть значение "БылВызванСценарийИзСоседнейФичи"
//@ВКонтекстеЕстьЗначение(Парам01)
Процедура ВКонтекстеЕстьЗначение(ИмяПараметра) Экспорт
	Ванесса.ПроверитьРавенство(Контекст.Свойство(ИмяПараметра),Истина,"Ожидали, что в Контекст есть свойство " + ИмяПараметра);
КонецПроцедуры

//окончание текста модуля
//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
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

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагружаюМакетИСохраняюДанныеИзМакетаВПеременную(Парам01,Парам02)","ЯЗагружаюМакетИСохраняюДанныеИзМакетаВПеременную","И я загружаю макет ""Макет"" и сохраняю данные из макета в переменную ""ДанныеИзМакета""","Создает данные из макета MXL, полученного через плагин ГенераторДанных, и помещает загруженные данные в переменную контекста", "Данные.Макеты");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагружаюМакет(Парам01)","ЯЗагружаюМакет","И я загружаю макет ""Макеты\ИмяФайлаМакета""","Загружает данные из макета MXL, полученного через плагин ГенераторДанных. Как и в соседних шага, макет может располагаться в каталоге проекта и можно указать путь относительно каталога проекта. Можно не указывать расширение mxl. Пример - 'Макеты\ИмяФайлаМакета'", "Данные.Макеты");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СуществуетМакет(Парам01)","СуществуетМакет","И существует макет ""ТысячаЭлементовСправочника1""","Проверяет наличие макета", "Данные.Макеты");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздаюFixturesПоМакету(Парам01)","ЯСоздаюFixturesПоМакету","Загружает данные из макета MXL, полученного через плагин ГенераторДанных", "");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагружаюМакетСПеременными(Парам01,ТабПарам)","ЯЗагружаюМакетСПеременными","И я загружаю макет ""Макет1"" с переменными:" + Символы.ПС + "	| ИмяПеременнойИзМакета | НовоеНазваниеПеременнойВКонтексте |" + Символы.ПС + "	| ДругоеИмяПеременнойИзМакета | '' |","Загружает данные из макета MXL, полученного через плагин ГенераторДанных. Возможно явно указать, какие ссылки\наборы записей будут сохранены в контексте. Вторая колонка необязательна. Далее можно воспользоваться спец.шагами из раздела ""UI.Формы.Открыть форму объекта"". Например, 'И Я открываю основную форму объекта из переменной ""ИмяПеременнойИзМакета""'","Данные.Макеты");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВБазеОтсутствуетПользовательИБ(Парам01)","ВБазеОтсутствуетПользовательИБ","Когда В базе отсутствует пользователь ИБ ""ТестовыйПользователь""","Проверяется отсутствие пользователя информационной базы","Данные.ПользователиИБ");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВБазеСуществуетПользовательИБ(Парам01)","ВБазеСуществуетПользовательИБ","Тогда В базе существует пользователь ИБ ""ТестовыйПользователь""","Проверяется наличие пользователя информационной базы","Данные.ПользователиИБ");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУдаляюПользователяИБ(Парам01)","ЯУдаляюПользователяИБ","И Я удаляю пользователя ИБ ""ТестовыйПользователь""","Удаление пользователя информационной базы","Данные.ПользователиИБ");

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
//И     Я создаю fixtures по макету "Макет1"
//@ЯСоздаюFixturesПоМакету(Парам01)
Процедура ЯСоздаюFixturesПоМакету(Знач ИмяМакета) Экспорт
	ЗагрузитьМакет(ИмяМакета);
КонецПроцедуры

&НаКлиенте
//Когда В базе отсутствует пользователь ИБ "ТестовыйПользователь"
//@ВБазеОтсутствуетПользовательИБ(Парам01)
Процедура ВБазеОтсутствуетПользовательИБ(ИмяПользователя) Экспорт
	ДопСообщениеОшибки = "Ожидали, что пользователь " + ИмяПользователя + " отсутствует в базе";
	Ванесса.ПроверитьИстину(ВБазеОтсутствуетПользовательИБСервер(ИмяПользователя), ДопСообщениеОшибки);
КонецПроцедуры

&НаСервереБезКонтекста
Функция ВБазеОтсутствуетПользовательИБСервер(ИмяПользователя)
	Возврат ПользователиИнформационнойБазы.НайтиПоИмени(ИмяПользователя) = Неопределено;
КонецФункции

&НаКлиенте
//Тогда В базе существует пользователь ИБ "ТестовыйПользователь"
//@ВБазеСуществуетПользовательИБ(Парам01)
Процедура ВБазеСуществуетПользовательИБ(ИмяПользователя) Экспорт
	ДопСообщениеОшибки = "Ожидали, что пользователь " + ИмяПользователя + " существует в базе";
	Ванесса.ПроверитьЛожь(ВБазеОтсутствуетПользовательИБСервер(ИмяПользователя), ДопСообщениеОшибки);
КонецПроцедуры

&НаКлиенте
//И Я удаляю пользователя ИБ "ТестовыйПользователь"
//@ЯУдаляюПользователяИБ(Парам01)
Процедура ЯУдаляюПользователяИБ(ИмяПользователя) Экспорт
	ЯУдаляюПользователяИБСервер(ИмяПользователя);
КонецПроцедуры

&НаСервереБезКонтекста
Процедура ЯУдаляюПользователяИБСервер(ИмяПользователя)
	ПользовательИБ = ПользователиИнформационнойБазы.НайтиПоИмени(ИмяПользователя);
	ПользовательИБ.Удалить();
КонецПроцедуры

&НаКлиенте
//и существует макет "ТысячаЭлементовСправочника1"
//@СуществуетМакет(Парам01)
Процедура СуществуетМакет(ИмяМакета) Экспорт
	Попытка
		Макет = Ванесса.ПолучитьМакетОбработки(ИмяМакета);
	Исключение
		ВызватьИсключение "Не найден макет "+ИмяМакета+" ошибка: "+ОписаниеОшибки();
	КонецПопытки;
КонецПроцедуры

&НаКлиенте
//И я загружаю макет "ТысячаЭлементовСправочника1"
//@ЯЗагружаюМакет(Парам01)
Процедура ЯЗагружаюМакет(Знач ИмяМакета) Экспорт
	ЗагрузитьМакет(ИмяМакета);
КонецПроцедуры

&НаКлиенте
//И     Я загружаю макет "Макет" и сохраняю данные из макета в переменную "ДанныеИзМакета"
//@ЯЗагружаюМакетИСохраняюДанныеИзМакетаВПеременную(Парам01,Парам02)
Процедура ЯЗагружаюМакетИСохраняюДанныеИзМакетаВПеременную(Знач ИмяМакета, Знач ИмяПеременнойКонтекста) Экспорт

	СтруктураДанных = ЗагрузитьМакет(ИмяМакета);
	//Ванесса.СохранитьЗначениеВКонтекст(ИмяПеременнойКонтекста, СтруктураДанных);
	Контекст.Вставить(ИмяПеременнойКонтекста, СтруктураДанных);

КонецПроцедуры

&НаКлиенте
//И я загружаю макет "Макет1" с переменными:
//@ЯЗагружаюМакетСПеременными(Парам01,ТабПарам)
Процедура ЯЗагружаюМакетСПеременными(Знач ИмяМакета, Знач ТаблицаИзФичи) Экспорт
	СтруктураДанных = ЗагрузитьМакет(ИмяМакета);
	Контекст.Вставить("ДанныеИзМакета", СтруктураДанных);

	ЕстьКолонкаПереименования = ТаблицаИзФичи.Количество() > 0 И ТаблицаИзФичи[0].Количество() > 1;
	Для каждого Строка Из ТаблицаИзФичи Цикл
		ИмяПеременнойМакета = Строка["Кол1"];
		ИмяПеременнойКонтекста = ИмяПеременнойМакета;
		Если ЕстьКолонкаПереименования Тогда
			ИмяПеременнойКонтекста = Строка["Кол2"];
		КонецЕсли;

		Контекст.Вставить(ИмяПеременнойКонтекста, СтруктураДанных[ИмяПеременнойМакета]);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Функция ЗагрузитьМакет(Знач ИмяМакета)

		Макет 								= Ванесса.ПолучитьМакетОбработки(ИмяМакета);
	Если Макет = Неопределено Тогда
		ВызватьИсключение "Не получили макет " + ИмяМакета;
	КонецЕсли;
		СтруктураДанных 					= Ванесса.СоздатьДанныеПоТабличномуДокументу(Макет);
		Ванесса.ПроверитьНеРавенство(СтруктураДанных, Неопределено, "Не удалось загрузить данные из макета MXL, полученного через плагин ГенераторДанных.");

		Возврат СтруктураДанных;
КонецФункции

//окончание текста модуля

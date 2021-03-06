
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

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВГлобальномМассивеФайловТогда(Парам01,Парам02)","ВГлобальномМассивеФайловТогда","Если в глобальном массиве ""МассивФичаФайлов"" 0 файлов Тогда","","","Условие");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ПокаЕстьФичаФайлыДляВыполненияЯВыполняюДействия()","ПокаЕстьФичаФайлыДляВыполненияЯВыполняюДействия","Тогда Пока есть фича файлы для выполнения я выполняю действия","","","Цикл");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждогоРаннераИзТаблицыРаннеровЯДелаю()","ДляКаждогоРаннераИзТаблицыРаннеровЯДелаю","Тогда для каждого раннера из таблицы раннеров я делаю","","","Цикл");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ТекущийРаннерСвободенТогда()","ТекущийРаннерСвободенТогда","Если текущий раннер свободен Тогда","","","Условие");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСобралИзРаннераТекущиеДанные()","ЯСобралИзРаннераТекущиеДанные","Тогда  я собрал из раннера текущие данные","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагружаюСписокФичаФайловИзУказанныхНастроекИФильтров()","ЯЗагружаюСписокФичаФайловИзУказанныхНастроекИФильтров","Когда я загружаю список фича файлов из указанных настроек и фильтров","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВызываюПроцедуруVanessaADD(Парам01)","ЯВызываюПроцедуруVanessaADD","Затем я вызываю процедуру Vanessa ADD ""ВычислитьPIDЭтогоСеансаСлужебный()""","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗапускаюНесколькоСеансовРаннеровСогласноУказанныхНастроек()","ЯЗапускаюНесколькоСеансовРаннеровСогласноУказанныхНастроек","Затем я запускаю несколько сеансов раннеров согласно указанных настроек","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСделалАктивнымСледующийФичаФайлИзСписка()","ЯСделалАктивнымСледующийФичаФайлИзСписка","Когда я сделал активным следующий фича файл из списка","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗагрузилВРаннерТекущийФичаФайлИЗапустилНаВыполнение()","ЯЗагрузилВРаннерТекущийФичаФайлИЗапустилНаВыполнение","Затем  я загрузил в раннер текущий фича файл и запустил на выполнение","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗакрываюСеансПовисшегоРаннераИВсехЕгоTestClient()","ЯЗакрываюСеансПовисшегоРаннераИВсехЕгоTestClient","Тогда я закрываю сеанс повисшего раннера и всех его TestClient","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЖдуКогдаВсеРаннерыЗакончатВыполнениеСценариев()","ЯЖдуКогдаВсеРаннерыЗакончатВыполнениеСценариев","И я жду когда все раннеры закончат выполнение сценариев","","");

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

&НаКлиенте
Процедура ОчиститьКаталогиОтчетов()
	Ванесса.ОчиститьСодержимоеКаталога(Ванесса.Объект.КаталогOutputAllure);
КонецПроцедуры

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
//Когда я загружаю список фича файлов из указанных настроек и фильтров
//@ЯЗагружаюСписокФичаФайловИзУказанныхНастроекИФильтров()
Процедура ЯЗагружаюСписокФичаФайловИзУказанныхНастроекИФильтров() Экспорт

	Если Ванесса.ПолучитьЗначениеДополнительногоПараметра("КаталогФичДляVBManager") = Неопределено Тогда
		Сообщить("НЕ ПЕРЕДАН КАТАЛОГ ФИЧ ДЛЯ ОБРАБОТКИ!!! Используется " + Ванесса.Объект.КаталогИнструментов + "\features");
		Ванесса.УстановитьЗначениеДополнительногоПараметра("КаталогФичДляVBManager",Ванесса.Объект.КаталогИнструментов + "\features");
	КонецЕсли;

	КаталогДляОбработки = Ванесса.ПолучитьЗначениеДополнительногоПараметра("КаталогФичДляVBManager");

	Сообщить("ПОТОМ УБРАТЬ!");
	КаталогДляОбработки = Ванесса.Объект.КаталогИнструментов + "\features";

	Сообщить("КаталогДляОбработки="+КаталогДляОбработки);

	МассивИДДляУдаления = Новый Массив;
	ВесьМассивФич       = Ванесса.ПолучитьМассивФичаФайловИзКаталогаСогласноНастроек(КаталогДляОбработки);
	ОднопоточныйМассив  = Новый Массив;

	Ид = -1;
	Для Каждого СтруктураФичи Из ВесьМассивФич Цикл
		Ид = Ид + 1;
		Для Каждого СтруктураТега Из СтруктураФичи.МассивТегов Цикл
			Если СтруктураТега.Тег = "onethread" Тогда
				ОднопоточныйМассив.Добавить(СтруктураФичи);
				МассивИДДляУдаления.Добавить(Ид);
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;

	Для Ккк = 0 По МассивИДДляУдаления.Количество()-1 Цикл
		Ид = МассивИДДляУдаления[МассивИДДляУдаления.Количество()-1-Ккк];
		ВесьМассивФич.Удалить(Ид);
	КонецЦикла;

	КонтекстСохраняемый.Вставить("ОднопоточныйМассивФичаФайлов",ОднопоточныйМассив);
	КонтекстСохраняемый.Вставить("МассивФичаФайлов",ВесьМассивФич);
	КонтекстСохраняемый.Вставить("ТекущийИДМассивФичаФайлов",-1);
	КонтекстСохраняемый.Вставить("ТекущийОднопоточныйИДМассивФичаФайлов",-1);
КонецПроцедуры

&НаКлиенте
//Затем я запускаю несколько сеансов раннеров согласно указанных настроек
//@ЯЗапускаюНесколькоСеансовРаннеровСогласноУказанныхНастроек()
Процедура ЯЗапускаюНесколькоСеансовРаннеровСогласноУказанныхНастроек() Экспорт

	КонтекстСохраняемый.Вставить("МассивРаннеров",Неопределено);

	МассивРаннеров = Новый Массив;
	Для Каждого СтрокаДанныеКлиентовТестирования Из Ванесса.ДанныеКлиентовТестирования Цикл
		Если Найти(НРег(СтрокаДанныеКлиентовТестирования.Имя),"runner") = 0  Тогда
			Продолжить;
		КонецЕсли;

		ИмяФайлаФлага = ПолучитьИмяВременногоФайла("txt");
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяФайлаФлага);
		//Создадим пустой файл. Это означачет что раннер свободен.
		ЗТ = Новый ЗаписьТекста(ИмяФайлаФлага,"UTF-8",,Истина);
		ЗТ.ЗаписатьСтроку("");
		ЗТ.Закрыть();


		МассивРаннеров.Добавить(Новый Структура("Имя,ИмяФайлаФлага",СтрокаДанныеКлиентовТестирования.Имя,ИмяФайлаФлага));
	КонецЦикла;


	Если МассивРаннеров.Количество() = 0 Тогда
		ВызватьИсключение "Не найдено ни одной строки в таблице клиентов тестирования, которая бы содержала <runner>";
	КонецЕсли;


	КонтекстСохраняемый.Вставить("МассивРаннеров",МассивРаннеров);


	Для Каждого Раннер Из МассивРаннеров Цикл
		ЕстьПодключение = Ванесса.ПолучитьКлиентаТестирования(Раннер.Имя, "");
		Если Не ЕстьПодключение Тогда
			ВызватьИсключение "Раннер <" + Раннер.Имя + "> не подключен.";
		КонецЕсли;
	КонецЦикла;


КонецПроцедуры

&НаКлиенте
//Когда я сделал активным следующий фича файл из списка
//@ЯСделалАктивнымСледующийФичаФайлИзСписка()
Процедура ЯСделалАктивнымСледующийФичаФайлИзСписка() Экспорт
КонецПроцедуры

&НаКлиенте
Процедура ОбновитьСтатусВыполненияФич()
	СтатусВыполненияФич = Контекст.СтатусВыполненияФич;
	ОкноVB = Ванесса.НайтиОкноVB();
	Если ОкноVB = Неопределено Тогда
		ВызватьИсключение "Не найдено окно VanessaADD в раннере " + Контекст.ИдТекущегоРаннера;
	КонецЕсли;

	ЭлементСтатистика = ОкноVB.НайтиОбъект(,,"Статистика");
	Если ЭлементСтатистика = Неопределено Тогда
		ВызватьИсключение "Не найден элемент Статистика на форме VB.";
	КонецЕсли;


	ТекстЗаголовка = ЭлементСтатистика.ТекстЗаголовка;

	Массив = Ванесса.РазложитьСтрокуВМассивПодстрокКлиент(ТекстЗаголовка,"/");

	СтрокаКоличествоУпавшихСценариев = Массив[Массив.Количество()-1-1];
	СтрокаКоличествоВсегоСценариев   = Массив[1];

	СтрокаКоличествоУпавшихСценариев = СтрЗаменить(СтрокаКоличествоУпавшихСценариев,Символы.НПП,"");
	СтрокаКоличествоВсегоСценариев   = СтрЗаменить(СтрокаКоличествоВсегоСценариев,Символы.НПП,"");

	ЧислоКоличествоУпавшихСценариев = Число(СтрокаКоличествоУпавшихСценариев);
	ЧислоКоличествоВсегоСценариев   = Число(СтрокаКоличествоВсегоСценариев);

	Если ЧислоКоличествоУпавшихСценариев > 0 Тогда
		ВызватьИсключение "Найден упавший сценарий!";
	КонецЕсли;

	ЧислоКоличествоУспешныхСценариев = ЧислоКоличествоВсегоСценариев - ЧислоКоличествоУпавшихСценариев;

	СтатусВыполненияФич.success = СтатусВыполненияФич.success + ЧислоКоличествоУспешныхСценариев;
	СтатусВыполненияФич.fail    = СтатусВыполненияФич.fail    + ЧислоКоличествоУпавшихСценариев;

	Ванесса.ПоказатьСтрокуСтатуса("Выполнение сценариев: успешных " + СтатусВыполненияФич.success + ", упавших: " + СтатусВыполненияФич.fail);

КонецПроцедуры

&НаКлиенте
//Дано я загрузил в раннер текущий фича файл и запустил на выполнение
//@ЯЗагрузилВРаннерТекущийФичаФайлИЗапустилНаВыполнение()
Процедура ЯЗагрузилВРаннерТекущийФичаФайлИЗапустилНаВыполнение() Экспорт
	Если (КонтекстСохраняемый.МассивФичаФайлов.Количество()-1) < КонтекстСохраняемый.ТекущийИДМассивФичаФайлов Тогда
		Сообщить("Закончились фичи. Не стал назначать раннеру фичу.");
		Возврат;
	КонецЕсли;

	Если Не Контекст.Свойство("СтатусВыполненияФич") Тогда
		Контекст.Вставить("СтатусВыполненияФич",Новый Структура);
		СтатусВыполненияФич = Контекст.СтатусВыполненияФич;
		СтатусВыполненияФич.Вставить("success",0);
		СтатусВыполненияФич.Вставить("fail",0);
	КонецЕсли;

	ТекИДФичи = -1;
	ТекущаяФича = Неопределено;
	Если Контекст.ИдТекущегоРаннера = 0 Тогда
		//значит возможно надо загрузить фичу из массива однопоточных фич, которые не могут работать одновременно
		Если (КонтекстСохраняемый.ОднопоточныйМассивФичаФайлов.Количество()-1) >= (КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов+1) Тогда
			Если КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов >= 0 Тогда
				ОбновитьСтатусВыполненияФич();
			КонецЕсли;

			КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов = КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов + 1;
			ТекущаяФича = КонтекстСохраняемый.ОднопоточныйМассивФичаФайлов[КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов].Фича;

			ТекИДФичи = КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов;

			Сообщить("" + ТекущаяДата() + ". Однопоточная фича №" + (КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов+1) + " из " + КонтекстСохраняемый.ОднопоточныйМассивФичаФайлов.Количество() + ". РаннерID="+Контекст.ИдТекущегоРаннера + ". " + ТекущаяФича);
		КонецЕсли;
	КонецЕсли;

	Если ТекущаяФича = Неопределено Тогда
		//Значит загрузим фичу из общего списка
		Если (КонтекстСохраняемый.МассивФичаФайлов.Количество()-1) >= (КонтекстСохраняемый.ТекущийИДМассивФичаФайлов+1) Тогда
			Если КонтекстСохраняемый.ТекущийИДМассивФичаФайлов >= 0 Тогда
				ОбновитьСтатусВыполненияФич();
			КонецЕсли;

			КонтекстСохраняемый.ТекущийИДМассивФичаФайлов = КонтекстСохраняемый.ТекущийИДМассивФичаФайлов + 1;
			ТекущаяФича = КонтекстСохраняемый.МассивФичаФайлов[КонтекстСохраняемый.ТекущийИДМассивФичаФайлов].Фича;

			ТекИДФичи = КонтекстСохраняемый.ТекущийИДМассивФичаФайлов;

			Сообщить("" + ТекущаяДата() + ". Обычная фича №" + (КонтекстСохраняемый.ТекущийИДМассивФичаФайлов+1) + " из " + КонтекстСохраняемый.МассивФичаФайлов.Количество() + ". РаннерID="+Контекст.ИдТекущегоРаннера + ". " + ТекущаяФича);
		КонецЕсли;
	КонецЕсли;

	Если ТекущаяФича = Неопределено Тогда
		Если Контекст.ИдТекущегоРаннера > 0 Тогда
			//значит получилось что нет фичи для запуска на раннерах с ид больше 0
			Возврат;
		КонецЕсли;


		Если Контекст.ИдТекущегоРаннера = 0 Тогда
			//Так не может быть в принципе. Всегда должна быть фича для выполнения.
			ВызватьИсключение "Не определена фича для выполнения на раннере №0.";
		КонецЕсли;
	КонецЕсли;


	Если ЗначениеЗаполнено(Ванесса.PIDЭтогоСеанса) Тогда
		Ванесса.СделатьОкноПроцессаАктивным(Число(СтрЗаменить(Ванесса.PIDЭтогоСеанса,Символы.НПП,"")));
	КонецЕсли;

	ОкноVB = Ванесса.НайтиОкноVB();

	ИмяФайлаФлага = КонтекстСохраняемый.МассивРаннеров[Контекст.ИдТекущегоРаннера].ИмяФайлаФлага;
	ИмяРаннера    = КонтекстСохраняемый.МассивРаннеров[Контекст.ИдТекущегоРаннера].Имя;
	Если ОкноVB = Неопределено Тогда
		//надо запустить VB внутри раннера и это окно не будет закрываться
		Ванесса.Шаг("Когда В панели разделов я выбираю ""Основная""");
		Ванесса.Шаг("И В панели функций я выбираю ""Путь к Vanessa ADD""");

		Ванесса.Шаг("И в поле ""Путь к Vanessa ADD"" я ввожу текст """ + Ванесса.Объект.КаталогИнструментов + "/bddRunner.epf""");
		Ванесса.Шаг("И я нажимаю на кнопку ""Записать и закрыть""");


		Ванесса.Шаг("Когда Я открываю VanessaADD в режиме TestClient со стандартной библиотекой для запуска в раннере");
		Ванесса.Шаг("И я устанавливаю флаг ""Формировать данные для отчета Allure""");
		Ванесса.Шаг("И в поле ""Таймаут запуска TestClient"" я ввожу текст """ + 25 + """");
		Ванесса.Шаг("И я снимаю флаг ""Обновлять состояние дерева при выполнении шагов""");

		Ванесса.Шаг("И в поле ""Файл флаг выполнения сценариев"" я ввожу текст """ + ИмяФайлаФлага + """");

		Порт1 = 48001 + Контекст.ИдТекущегоРаннера*20;
		Порт2 = 48000 + (Контекст.ИдТекущегоРаннера+1)*20;
		ДиапазонПортов = XMLСтрока(Порт1) + "-" + XMLСтрока(Порт2);
		Ванесса.Шаг("И в поле ""Диапазон портов testclient"" я ввожу текст """ + ДиапазонПортов + """");
		Ванесса.Шаг("И в поле ""ИД раннера"" я ввожу текст """ + ИмяРаннера + """");
	КонецЕсли;

	ОкноVB = Ванесса.НайтиОкноVB();
	Если ОкноVB = Неопределено Тогда
		ВызватьИсключение "Не найдено окно VanessaADD.";
	КонецЕсли;


	Ванесса.УдалитьФайлыКомандаСистемы(ИмяФайлаФлага);
	//если файл есть - значит все сценарии в раннере выполнены
	//файл удаляется и появится когда раннер выполнит все сценарии

	Если ЗначениеЗаполнено(Ванесса.Объект.КаталогOutputAllure) Тогда
		Если НЕ Контекст.Свойство("ДелалОчисткуКаталогов") Тогда
			Контекст.Вставить("ДелалОчисткуКаталогов",Ложь);
		КонецЕсли;

		Если НЕ Контекст.ДелалОчисткуКаталогов Тогда
			ОчиститьКаталогиОтчетов();
			Контекст.Вставить("ДелалОчисткуКаталогов",Истина);
		КонецЕсли;

		ТекущаяФичаФайл = Новый Файл(ТекущаяФича);

		Путь = Ванесса.Объект.КаталогOutputAllure + "\" + Ванесса.Транслит(ТекущаяФичаФайл.ИмяБезРасширения)
		                       + "_" + XMLСтрока(ТекИДФичи);

		Ванесса.Шаг("И в поле ""Временный каталог файлов результатов Allure"" я ввожу текст """ + Путь + """");
	КонецЕсли;


	Ванесса.Шаг("И я перехожу к закладке ""Служебная""");
	Ванесса.Шаг("И в поле ""Каталог фич (служебный)"" я ввожу текст """ + ТекущаяФича + """");
	Ванесса.Шаг("И я снимаю флаг с именем ""ФлагСценарииВыполнены""");
	Ванесса.Шаг("И я нажимаю на кнопку ""Перезагрузить и выполнить""");

КонецПроцедуры

&НаКлиенте
//Тогда я закрываю сеанс повисшего раннера и всех его TestClient
//@ЯЗакрываюСеансПовисшегоРаннераИВсехЕгоTestClient()
Процедура ЯЗакрываюСеансПовисшегоРаннераИВсехЕгоTestClient() Экспорт

КонецПроцедуры

&НаКлиенте
//Если в глобальном массиве "МассивФичаФайлов" 0 файлов Тогда
//@ВГлобальномМассивеФайловТогда(Парам01,Парам02)
Процедура ВГлобальномМассивеФайловТогда(ИмяПеременнойМассива,Количество) Экспорт
	МассивФайлов = КонтекстСохраняемый[ИмяПеременнойМассива];
	Если МассивФайлов.Количество() = Количество Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
	Иначе
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
//Дано я собрал из раннера текущие данные
//@ЯСобралИзРаннераТекущиеДанные()
Процедура ЯСобралИзРаннераТекущиеДанные() Экспорт

КонецПроцедуры

&НаКлиенте
//Тогда Пока есть не выполненный фича файл я выполняю действия
//@ПокаЕстьФичаФайлыДляВыполненияЯВыполняюДействия()
Процедура ПокаЕстьФичаФайлыДляВыполненияЯВыполняюДействия() Экспорт
	Если (КонтекстСохраняемый.МассивФичаФайлов.Количество()-1) >= (КонтекстСохраняемый.ТекущийИДМассивФичаФайлов+1)
	Или  (КонтекстСохраняемый.ОднопоточныйМассивФичаФайлов.Количество()-1) >= (КонтекстСохраняемый.ТекущийОднопоточныйИДМассивФичаФайлов+1)
	Тогда
		//значит мы можем увеличить ид на 1 и не выйдем за границы массива
		Ванесса.УстановитьРезультатУсловия(Истина);
	Иначе
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
//Тогда для каждого раннера из таблицы раннеров я делаю
//@ДляКаждогоРаннераИзТаблицыРаннеровЯДелаю()
Процедура ДляКаждогоРаннераИзТаблицыРаннеровЯДелаю() Экспорт
	//Возврат;

	Если Не Контекст.Свойство("ИдТекущегоРаннера") Тогда
		Контекст.Вставить("ИдТекущегоРаннера",-1);
	КонецЕсли;

	Контекст.ИдТекущегоРаннера = Контекст.ИдТекущегоРаннера + 1;

	Если (КонтекстСохраняемый.МассивРаннеров.Количество()-1) >= Контекст.ИдТекущегоРаннера Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
		Ванесса.Шаг("И я активизирую TestClient """ + КонтекстСохраняемый.МассивРаннеров[Контекст.ИдТекущегоРаннера].Имя + """");
	Иначе
		Контекст.Вставить("ИдТекущегоРаннера",-1);
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;

КонецПроцедуры

&НаКлиенте
//Если текущий раннер свободен Тогда
//@ТекущийРаннерСвободенТогда()
Процедура ТекущийРаннерСвободенТогда() Экспорт
	ИмяФайлаФлага = КонтекстСохраняемый.МассивРаннеров[Контекст.ИдТекущегоРаннера].ИмяФайлаФлага;

	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяФайлаФлага) Тогда
		Ванесса.УстановитьРезультатУсловия(Истина);
	Иначе
		Ванесса.УстановитьРезультатУсловия(Ложь);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
//И я жду когда все раннеры закончат выполнение сценариев
//@ЯЖдуКогдаВсеРаннерыЗакончатВыполнениеСценариев()
Процедура ЯЖдуКогдаВсеРаннерыЗакончатВыполнениеСценариев() Экспорт

	Пока Истина Цикл
		ЕстьВсеФайлыФлаги = Истина;

		Для Каждого Раннер Из КонтекстСохраняемый.МассивРаннеров Цикл
			ИмяФайлаФлага = Раннер.ИмяФайлаФлага;

			Если НЕ Ванесса.ФайлСуществуетКомандаСистемы(ИмяФайлаФлага) Тогда
				ЕстьВсеФайлыФлаги = Ложь;
			КонецЕсли;
		КонецЦикла;

		Если ЕстьВсеФайлыФлаги Тогда
			Прервать;
		КонецЕсли;

		Ванесса.Sleep(2);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
//Затем я вызываю процедуру Vanessa ADD "ВычислитьPIDЭтогоСеансаСлужебный()"
//@ЯВызываюПроцедуруVanessaADD(Парам01)
Процедура ЯВызываюПроцедуруVanessaADD(ИмяПроцедуры) Экспорт
	Выполнить("Ванесса." + ИмяПроцедуры);
КонецПроцедуры

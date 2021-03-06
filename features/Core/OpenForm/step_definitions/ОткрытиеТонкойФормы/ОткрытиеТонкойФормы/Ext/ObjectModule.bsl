Перем Ванесса;

Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;

	ВсеТесты = Новый Массив;

	//пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯРаботаюСVanessa_ADDepf()","ЯРаботаюСVanessa_ADDepf","я работаю с bddRunner.epf");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯРаботаюСbddRunnerepf()","ЯРаботаюСVanessa_ADDepf","я работаю с bddRunner.epf");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯМогуОткрытьФормуОбработки()","ЯМогуОткрытьФормуОбработки","я могу открыть форму обработки");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯМогуЗакрытьФормуОбработки()","ЯМогуЗакрытьФормуОбработки","я могу закрыть форму обработки");

	Возврат ВсеТесты;
КонецФункции

Процедура ПередНачаломСценария() Экспорт

КонецПроцедуры

Процедура ПередОкончаниемСценария() Экспорт

КонецПроцедуры


//я работаю с bddRunner.epf
//@ЯРаботаюСVanessa_ADDepf()
Процедура ЯРаботаюСVanessa_ADDepf() Экспорт
	ПутьКОбработке = Ванесса.ИспользуемоеИмяФайла;
	НовыйЭкземпляр = ВнешниеОбработки.Создать(ПутьКОбработке);
	НовыйЭкземпляр.РежимСамотестирования = Истина;


	Форма = НовыйЭкземпляр.ПолучитьФорму("Форма");
	Ванесса.ПроверитьРавенство(Форма.Открыта(),Ложь,"Мы должны были получить новый экземпляр формы.");
	Контекст.Вставить("ОткрытаяФормаVanessaADD",Форма);
КонецПроцедуры

//я могу открыть форму обработки
//@ЯМогуОткрытьФормуОбработки()
Процедура ЯМогуОткрытьФормуОбработки() Экспорт
	ОткрытаяФормаVanessaADD = Контекст.ОткрытаяФормаVanessaADD;
	ОткрытаяФормаVanessaADD.Открыть();

	Ванесса.ПроверитьРавенство(ОткрытаяФормаVanessaADD.Открыта(),Истина,"Форма vanessa-add открылась.");
КонецПроцедуры

//я могу закрыть форму обработки
//@ЯМогуЗакрытьФормуОбработки()
Процедура ЯМогуЗакрытьФормуОбработки() Экспорт
	ОткрытаяФормаVanessaADD = Контекст.ОткрытаяФормаVanessaADD;
	ОткрытаяФормаVanessaADD.Закрыть();

	Ванесса.ПроверитьРавенство(ОткрытаяФормаVanessaADD.Открыта(),Ложь,"Форма vanessa-add закрылась.");
КонецПроцедуры

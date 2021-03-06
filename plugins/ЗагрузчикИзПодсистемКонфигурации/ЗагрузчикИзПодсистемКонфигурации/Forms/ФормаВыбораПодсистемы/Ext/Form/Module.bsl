Перем мМассивПиктограммТиповСтроки;

Процедура ПриОткрытии()
	ЗаполнитьДеревоПодсистем(ДеревоПодсистем, ОтборПоИмениТеста);
КонецПроцедуры

Процедура ДеревоПодсистемПриВыводеСтроки(Элемент, ОформлениеСтроки, ДанныеСтроки)
	ОформлениеСтроки.Ячейки.Имя.УстановитьКартинку(мМассивПиктограммТиповСтроки[ДанныеСтроки.ТипСтроки]);
КонецПроцедуры

Процедура ДеревоПодсистемВыбор(Элемент, ВыбраннаяСтрока, Колонка, СтандартнаяОбработка)
	СтандартнаяОбработка = ложь;
	ЭтаФорма.Закрыть(ВыбраннаяСтрока.Путь);
КонецПроцедуры

//{ Типы строк дерева тестов
мМассивПиктограммТиповСтроки = Новый Массив(8);
мМассивПиктограммТиповСтроки[мЗначенияТиповСтроки.ТестовыйСлучай]  = ЭлементыФормы.ПолеКартинкиТест.Картинка;
мМассивПиктограммТиповСтроки[мЗначенияТиповСтроки.Подсистема]      = ЭлементыФормы.ПолеКартинкиПодсистема.Картинка;
мМассивПиктограммТиповСтроки[мЗначенияТиповСтроки.ТестовыйСлучайОтчет]  = ЭлементыФормы.ПолеКартинкиТестОтчет.Картинка;
мМассивПиктограммТиповСтроки = Новый ФиксированныйМассив(мМассивПиктограммТиповСтроки);
//} Типы строк дерева тестов
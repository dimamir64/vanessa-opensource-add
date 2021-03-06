#Если ТолстыйКлиентОбычноеПриложение или ТолстыйКлиентУправляемоеПриложение Тогда

Перем ПутьФайла1;
Перем ПутьФайла2;

//{ основная процедура для юнит-тестирования xUnitFor1C
Перем КонтекстЯдра;
Перем Ожидаем;
Перем Утверждения;

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	КонтекстЯдра = КонтекстЯдраПараметр;
	Ожидаем = КонтекстЯдра.Плагин("УтвержденияBDD");
	Утверждения = КонтекстЯдра.Плагин("БазовыеУтверждения");
	ГенераторТестовыхДанных = КонтекстЯдра.Плагин("СериализаторMXL");
	ЗапросыИзБД = КонтекстЯдра.Плагин("ЗапросыИзБД");
	УтвержденияПроверкаТаблиц = КонтекстЯдра.Плагин("УтвержденияПроверкаТаблиц");
КонецПроцедуры

Процедура ЗаполнитьНаборТестов(НаборТестов) Экспорт
	НаборТестов.Добавить("ТестДолжен_ПроверитьРавенствоФайлов");
	НаборТестов.Добавить("ТестДолжен_ПроверитьРавенствоФайловСУчетомПереданныхПараметровСравнения");
КонецПроцедуры

//}

//{ блок юнит-тестов - сами тесты

Процедура ПередЗапускомТеста() Экспорт
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	Попытка
		УдалитьФайлы(ПутьФайла1);
		УдалитьФайлы(ПутьФайла2);
	Исключение
	КонецПопытки;
КонецПроцедуры

Процедура ТестДолжен_ПроверитьРавенствоФайлов() Экспорт
	МассивСтрок = Новый Массив();
	Для к = 1 По 10 Цикл
		МассивСтрок.Добавить("строка "+к);
	КонецЦикла;
	ПутьФайла1 = ПолучитьИмяВременногоФайла("txt");
	СоздатьТекстовыйФайл(ПутьФайла1, МассивСтрок);

	ПутьФайла2 = ПолучитьИмяВременногоФайла("txt");
	СоздатьТекстовыйФайл(ПутьФайла2, МассивСтрок);
	
	ПоказатьРазличия = Ложь;
	Утверждения.ПроверитьРавенствоФайлов(ПутьФайла1, ПутьФайла2, "ПутьФайла1, ПутьФайла2",, ПоказатьРазличия);
КонецПроцедуры

Процедура ТестДолжен_ПроверитьРавенствоФайловСУчетомПереданныхПараметровСравнения() //Экспорт // тест есть, а функционала пока нет
	СравнениеФайлов = Новый СравнениеФайлов;
	СравнениеФайлов.УчитыватьРегистр = Ложь;
	СравнениеФайлов.СпособСравнения = СпособСравненияФайлов.ТекстовыйДокумент;
	
	МассивСтрок = Новый Массив();
	Для к = 1 По 10 Цикл
		МассивСтрок.Добавить("строка "+к);
	КонецЦикла;
	ПутьФайла1 = ПолучитьИмяВременногоФайла();
	СоздатьТекстовыйФайл(ПутьФайла1, МассивСтрок);
	
	МассивСтрок2 = Новый Массив();
	Для каждого Строка Из МассивСтрок Цикл
		МассивСтрок2.Добавить(ВРег(Строка));
	КонецЦикла;

	ПутьФайла2 = ПолучитьИмяВременногоФайла();
	СоздатьТекстовыйФайл(ПутьФайла2, МассивСтрок2);
	
	БылаПопытка = Ложь;
	Попытка
		Утверждения.ПроверитьРавенствоФайловСУчетомПереданныхПараметровСравнения(СравнениеФайлов, ПутьФайла1, ПутьФайла2, "ПутьФайла1, ПутьФайла2");
	Исключение
		БылаПопытка = Истина;
	КонецПопытки;
	Утверждения.ПроверитьЛожь(БылаПопытка, "Ожидали исключение на утверждении сравнения файлов, а его не было");
КонецПроцедуры

Процедура СоздатьТекстовыйФайл(ПутьФайла, МассивСтрок)
	Текст = Новый ТекстовыйДокумент;
	Для каждого Строка Из МассивСтрок Цикл
		Текст.ДобавитьСтроку(Строка);
	КонецЦикла;
	Текст.Записать(ПутьФайла);
КонецПроцедуры

//} 
#КонецЕсли 


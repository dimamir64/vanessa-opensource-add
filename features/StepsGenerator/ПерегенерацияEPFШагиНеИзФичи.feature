# language: ru

@IgnoreOnLinux
@OneThread
@IgnoreOnWeb

Функционал: Проверка перегенерации EPF, когда в epf есть шаг без фичи
	Как Разработчик
	Я Хочу чтобы чтобы при перегенерации epf уже шаги в функции ПолучитьСписокТестов сохранились, если они есть в этой EPF


	Сценарий: Перегенерация EPF c проверкой на уже реализованные шаги в epf, хотя их нет в данной фиче

	Когда я открыл форму VanessaADD в режиме самотестирования
	И я загрузил специальную тестовую фичу "ФичаДляПерегенерацияEPFШагиНеИзФичи"
	И Пауза 1
	И я перешел на закладку генератор EPF
	И ожидаемый файл ФичаДляПерегенерацияEPFШагиНеИзФичи уже существует
	И я нажал на кнопку "СоздатьШаблоныОбработок"
	И Пауза 10
	Тогда я получил сгенерированный epf файл в ожидаемом каталоге
	И сгенерированный epf прошел проверку на корректность после перегенерации, что в нём остались шаги не из фичи

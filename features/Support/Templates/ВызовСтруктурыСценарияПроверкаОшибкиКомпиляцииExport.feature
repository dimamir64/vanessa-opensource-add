# encoding: utf-8
# language: ru

@tree
@ExportScenarios
@IgnoreOnCIMainBuild

Функционал: Тест



Контекст: 
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

# Здесь в строке "Структура Сценария" пишется Уникальное Имя Сценария, по которому его смогут вызывать другие Сценарии
Структура Сценария: Заполнение Справочника Контрагентов (Общий) (с Уникальным Именем)


	И     Я закрываю окно 'Контрагенты'

	
# Эти ПРИМЕРЫ - только для примера ТУТ - настоящий Список Контрагентов находится в вызывающем Сценарии
Примеры:
	|PartnerName|MainContact|Responsible|RegCountry|
	|	AALBORG PORTLAND - Denmark	|	Kent Rønning Andersen	|	Юрий Буренко	|	Denmark	|

# language: ru

@IgnoreOnCIMainBuild
@ExportScenarios

Функционал: Cлужебная фича для проверки метода шаг при работе с экспортными сценариями
	Как Разработчик
	Я Хочу чтобы если я вызываю метод шаг
	Чтобы снипеты экспортного сценария были выполнены корректно
 

Структура сценария: Это вложенная структура сценария для проверки метода шаг
	Когда Я вызвал обычный шаг структуры сценария <Параметр1>
	Тогда В КонтекстСохраняемый есть значение "Значение1" равное "Значение1"

Примеры:
	| Параметр1 |	
	| Значение1 |	
	

Сценарий: Это вложенный сценарий для проверки метода шаг
	Когда Я вызвал обычный шаг сценария
	


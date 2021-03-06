# language: ru

@IgnoreOnCIMainBuild
@IgnoreOnWeb

Функционал: Проверка работы областей в дереве
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность на основании службеных слов Область и КонецОбласти группировать шаги
	Для того чтобы я мог удобно расположить шаги в дереве


	Сценарий: Загрузка фичи в которой указаны области

	Когда я открыл форму VanessaADD в режиме самотестирования
	И я загрузил специальную тестовую фичу "ПростаяФичаДляПроверкиРаботыОбластей"
	И Пауза 1
	Тогда в дереве загруженной фичи будет группа "ПерваяГруппа"
	И     в дереве загруженной фичи будет группа "ВтораяГруппа"
	И     в дереве загруженной фичи внутри группы "ВтораяГруппа" будет группа "ТретьяГруппа"
	И     в дереве загруженной фичи шаг "Когда Первый шаг фичи Проверка работы областей в дереве" будет внутри группы "ПерваяГруппа"
	И     в дереве загруженной фичи шаг "Тогда Второй шаг фичи Проверка работы областей в дереве" будет внутри группы "ВтораяГруппа"
	И     в дереве загруженной фичи шаг "И     Третий шаг фичи Проверка работы областей в дереве" будет внутри группы "ТретьяГруппа"

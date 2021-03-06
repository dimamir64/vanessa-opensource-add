# language: ru

@IgnoreOnWeb

Функционал: Проверка работы областей в дереве питон стайл
	Как Разработчик
	Я Хочу чтобы чтобы у меня была возможность на основании специального тега и символов табуляции строить дерево фичи
	Для того чтобы я мог удобно расположить шаги в дереве


Сценарий: Проверка переходов в уровнях иерархии

	Когда я открыл форму VanessaADD в режиме самотестирования
	И я загрузил специальную тестовую фичу "ПроверкаОбычныйСценарийТег_tree3"
	И Пауза 1
	Тогда в дереве загруженной фичи будет группа "И ПерваяГруппа"
	И     в дереве загруженной фичи будет группа "И ВтораяГруппа"
	И     в дереве загруженной фичи будет группа "И ТретьяГруппа"
	И     в дереве загруженной фичи внутри группы "И ПерваяГруппа" будет группа "И ВтораяГруппа"
	И     в дереве загруженной фичи внутри группы "И ПерваяГруппа" будет группа "И ЧетвертаяГруппа"
	И     в дереве загруженной фичи внутри группы "И ВтораяГруппа" будет группа "И ТретьяГруппа"
	И     в дереве загруженной фичи внутри группы "И ЧетвертаяГруппа" будет группа "И ПятаяГруппа"
	И     в дереве загруженной фичи шаг "И ПерваяГруппа" будет вне группы
	И     в дереве загруженной фичи шаг "И СедьмаяГруппа" будет вне группы
	И     в дереве загруженной фичи шаг "И ВосьмаяГруппа" будет вне группы
	И     в дереве загруженной фичи шаг "И ДесятаяГруппа" будет вне группы
	И     в дереве загруженной фичи шаг "И ОдиннадцатаяГруппа" будет вне группы
	И     в дереве загруженной фичи шаг "И ДвенадцатаяГруппа" будет вне группы
	И     в дереве загруженной фичи шаг "И ТринадцатаяГруппа" будет вне группы
	И     в дереве загруженной фичи шаг "И ЧетырнадцатаяГруппа" будет вне группы


Сценарий: Проверка третьего уровня иерархии

	Когда я открыл форму VanessaADD в режиме самотестирования
	И я загрузил специальную тестовую фичу "ПроверкаОбычныйСценарийТег_tree2"
	И Пауза 1
	Тогда в дереве загруженной фичи будет группа "И ПерваяГруппа"
	И     в дереве загруженной фичи будет группа "И ВтораяГруппа"
	И     в дереве загруженной фичи будет группа "И ТретьяГруппа"
	И     в дереве загруженной фичи внутри группы "И ПерваяГруппа" будет группа "И ВтораяГруппа"
	И     в дереве загруженной фичи внутри группы "И ПерваяГруппа" будет группа "И ТретьяГруппа"
	И     в дереве загруженной фичи внутри группы "И ЧетвертаяГруппа" будет группа "И ПятаяГруппа"
	И     в дереве загруженной фичи внутри группы "И ЧетвертаяГруппа" будет группа "И ШестаяГруппа"
	И     в дереве загруженной фичи шаг "И ЧетвертаяГруппа" будет вне группы



Сценарий: Проверка третьего уровня иерархии

	Когда я открыл форму VanessaADD в режиме самотестирования
	И я загрузил специальную тестовую фичу "ПроверкаОбычныйСценарийТег_tree1"
	И Пауза 1
	Тогда в дереве загруженной фичи будет группа "И ПерваяГруппа"
	И     в дереве загруженной фичи будет группа "И ВтораяГруппа"
	И     в дереве загруженной фичи будет группа "И ТретьяГруппа"
	И     в дереве загруженной фичи шаг "И ТретьяГруппа" будет вне группы



Сценарий: Загрузка фичи в которой указаны области

	Когда я открыл форму VanessaADD в режиме самотестирования
	И я загрузил специальную тестовую фичу "ПростаяФичаДляПроверкиРаботыОбластейПитонСтайл"
	И Пауза 1
	Тогда в дереве загруженной фичи будет группа "И ПерваяГруппа"
	И     в дереве загруженной фичи будет группа "И ВтораяГруппа"
	И     в дереве загруженной фичи внутри группы "И ВтораяГруппа" будет группа "И ТретьяГруппа"
	И     в дереве загруженной фичи шаг "Тогда шаг внтури первой группы" будет внутри группы "И ПерваяГруппа"
	И     в дереве загруженной фичи шаг "Тогда шаг внтури второй группы" будет внутри группы "И ВтораяГруппа"
	И     в дереве загруженной фичи шаг "Тогда шаг внтури третьей группы" будет внутри группы "И ТретьяГруппа"
	И     в дереве загруженной фичи шаг "Тогда ещё шаг внтури второй группы" будет внутри группы "И ВтораяГруппа"
	И     в дереве загруженной фичи шаг "И ещё один шаг вне группы" будет вне группы

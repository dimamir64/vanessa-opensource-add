# language: ru


@IgnoreOn82Builds
@IgnoreOnOFBuilds

#т.к. используется метод УстановитьРезультатДиалогаВыбораФайла
@IgnoreOn836
@IgnoreOn837

@tree




Функционал: Автоматизированное получение данных макетов

Как Разработчик я хочу
Чтобы у меня был функционал для получения данных макета из TestClient
Для того чтобы я мог использовать их в своих сценариях без программирования



Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	Дано Я задаю параметры чтения области макета "R1C1:R10C10"




Сценарий: Я запоминаю значение макета и потом сравниваю с текущим макетом
	Когда я удаляю все элементы Справочника "Справочник3"


	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     в панели функций я выбираю "Справочник3"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И     В открытой форме в поле с заголовком "Наименование" я ввожу текст "Тест"
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	И     я нажимаю на кнопку "Сформировать отчет"


	И     табличный документ формы с именем "РеквизитТабличныйДокумент" стал равен:
		| 'Наименование'    | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Тест'            | 'Нет'              | '*'            | ''                          | '1,2'           |

	И я запоминаю значение табличного документа "РеквизитТабличныйДокумент" как "ТабДок1"
	И я запоминаю значение табличного документа "РеквизитТабличныйДокумент" как "ТабДок2"

	И значения табличных документов равны
		| "ТабДок1" |
		| "ТабДок2" |

	И в табличном документе "РеквизитТабличныйДокумент" ячейка с адресом "R5C2" равна "Тест"

Сценарий: Я получаю данные макета где есть объединенные ячейки
	Когда я удаляю все элементы Справочника "Справочник3"


	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     в панели функций я выбираю "Справочник3"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И     В открытой форме в поле с заголовком "Наименование" я ввожу текст "Тест"
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	И     я нажимаю на кнопку "Сформировать отчет объединенные ячейки"


	#Тогда Я задаю системные параметры считывания макета НачСтр 1 НачКол 1 КолСтр 5 КолКол 6
	И     я нажимаю на кнопку Vanessa-ADD "Забыть состояние формы TestClient"
	И     я нажимаю на кнопку Vanessa-ADD "ПолучитьИзмененияФормыGherkin"


	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'Предопределенный'

	И     табличный документ формы с именем "РеквизитТабличныйДокумент" стал равен:
		| 'Наименование'    | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Тест'            | 'Нет'              | '*'            | ''                          | '1,2'           |

	И     табличный документ "РеквизитТабличныйДокумент" равен по шаблону:
		| 'Наиме*ние'       | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | '*Число'        |
		| 'Тест'            | 'Н*т'              | '*'            | ''                          | '1,2'           |

	И     В открытой форме я нажимаю на кнопку "Записать и закрыть"



Сценарий: Проверка получения областей табличного документа
	Когда я удаляю все элементы Справочника "Справочник3"


	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     в панели функций я выбираю "Справочник3"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И     В открытой форме в поле с заголовком "Наименование" я ввожу текст "Тест"
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	И     В открытой форме я нажимаю на кнопку с заголовком "Сформировать отчет"
	И     я жду когда в табличном документе "РеквизитТабличныйДокумент" заполнится ячейка "r4c2" в течение 20 секунд

	#этот шаг не работает в Web, т.к. надо обязательно сохранить табличный документ в файл
	И Табличный документ "РеквизитТабличныйДокумент" содержит значения областей
		| "ОбластьПерваяСтрокаОтчетаНаименование" | "Тест" |

	И Табличный документ "РеквизитТабличныйДокумент" содержит строки в областях
		| "ОбластьПерваяСтрокаОтчетаНаименование" | "Тес" |

	И Табличный документ "РеквизитТабличныйДокумент" содержит значения областей по шаблону
		| "ОбластьПерваяСтрокаОтчетаНаименование" | "*ес*" |

	И     табличный документ формы с именем "РеквизитТабличныйДокумент" стал равен:
		| 'Наименование' | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Тест'         | 'Нет'              | *              | ''                          | '1,2'           |




Сценарий: Я получаю данные макета открытого отдельным окном
	Когда я удаляю все элементы Справочника "Справочник3"


	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     в панели функций я выбираю "Справочник3"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И     В открытой форме в поле с заголовком "Наименование" я ввожу текст "Тест"
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	И     В открытой форме я нажимаю на кнопку с заголовком "Сформировать отчет"
	И     я жду когда в табличном документе "РеквизитТабличныйДокумент" заполнится ячейка "r4c2" в течение 20 секунд



	#Проверка работы расшифровки
	Если Версия платформы ">=" "8.3.9" Тогда
			#на 8.3.8 не сработал шаг я делаю двойной клик на текущей ячейке.
			И     у табличного документа с именем "РеквизитТабличныйДокумент" я перехожу к ячейке "R5C2"
			И пауза 1
			И     у табличного документа с именем "РеквизитТабличныйДокумент" я делаю двойной клик на текущей ячейке
			И пауза 1
			Тогда появилось предупреждение, содержащее текст "Тест"
			И     я нажимаю на кнопку "OK"

	#проверка на частичное чтение табличного документа
	#Тогда Я задаю системные параметры считывания макета НачСтр 1 НачКол 1 КолСтр 4 КолКол 6
	#Тогда Я задаю параметры чтения области макета "R1C1:R5C6"
	И     табличный документ формы с именем "РеквизитТабличныйДокумент" стал равен:
		| 'Наименование' | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Тест'         | 'Нет'              | '*'            | ''                          | '1,2'           |


	#Тогда Я задаю системные параметры считывания макета НачСтр 1 НачКол 1 КолСтр 5 КолКол 6
	И     я нажимаю на кнопку Vanessa-ADD "Забыть состояние формы TestClient"
	И     я нажимаю на кнопку Vanessa-ADD "ПолучитьИзмененияФормыGherkin"


	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'Предопределенный'

	Дано Я задаю параметры чтения области макета "R1C1:R5C6"
	И табличный документ "РеквизитТабличныйДокумент" соответствует макету "Макет1"
	И область "R4C3:R5C6" табличного документа "РеквизитТабличныйДокумент" равна макету "МакетОбласть1"
	И область "R4C3:R5C6" табличного документа "РеквизитТабличныйДокумент" равна макету "МакетОбласть2" по шаблону
	И область "R4C3:R5C6" табличного документа "РеквизитТабличныйДокумент" стала равна
		| 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Нет'              |        '*'     |     ''                      |     '1,2'       |

	И область "R4C3:R5C6" табличного документа "РеквизитТабличныйДокумент" равна по шаблону
		| 'Предо*'           | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Нет'              |        '*'     |     ''                      |     '1*2'       |

	И     табличный документ формы с именем "РеквизитТабличныйДокумент" стал равен:
		| 'Наименование' | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Тест'         | 'Нет'              | '*'            | ''                          | '1,2'           |

	И     табличный документ формы с именем "РеквизитТабличныйДокумент" содержит строки:
		| 'Тест'         | 'Нет'              | '*'            | ''                          | '1,2'           |

	И табличный документ "РеквизитТабличныйДокумент" содержит значения:
		| 'Тест'         |
		| 'Нет'          |

	И табличный документ "РеквизитТабличныйДокумент" не содержит значения:
		| '1111111111'         |
		| '2222222222'         |

#для строк
	И в табличном документе "РеквизитТабличныйДокумент" значения в колонке "Наименование" равно значению "Тест"
	И в табличном документе "РеквизитТабличныйДокумент" значения в колонке "Наименование" неравно значению "1111111111"

#для чисел
	И в табличном документе "РеквизитТабличныйДокумент" значения в колонке "ПараметрЧисло" соответствуют условию  "больше"  1.1



	И     В открытой форме я нажимаю на кнопку "Записать и закрыть"


Сценарий: Я получаю данные макета открытого отдельным окном когда в ячейке макета есть экранированная вертикальная черта
	Когда я удаляю все элементы Справочника "Справочник3"


	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     в панели функций я выбираю "Справочник3"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И     В открытой форме в поле с заголовком "Наименование" я ввожу текст "Тест"
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	И     В открытой форме я нажимаю на кнопку с заголовком "Сформировать отчет с вертикальной чертой"


	#Тогда Я задаю системные параметры считывания макета НачСтр 1 НачКол 1 КолСтр 5 КолКол 6
	И     я нажимаю на кнопку Vanessa-ADD "Забыть состояние формы TestClient"
	И     я нажимаю на кнопку Vanessa-ADD "ПолучитьИзмененияФормыGherkin"


	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'Предопределенный'

	И     табличный документ формы с именем "РеквизитТабличныйДокумент" стал равен:
		| 'Наименование'    | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Тест\|ДопСтрока' | 'Нет'              | '*'            | ''                          | '1,2'           |

	И     В открытой форме я нажимаю на кнопку "Записать и закрыть"





Сценарий: Я получаю данные макета открытого отдельным окном когда в ячейке макета есть вертикальная черта
	Когда я удаляю все элементы Справочника "Справочник3"


	Когда Я нажимаю кнопку командного интерфейса "Основная"
	И     в панели функций я выбираю "Справочник3"
	И     В открытой форме я нажимаю на кнопку с заголовком "Создать"
	Тогда открылось окно "Справочник3 (создание)"
	И     В открытой форме в поле с заголовком "Наименование" я ввожу текст "Тест"
	И     В открытой форме я нажимаю на кнопку с заголовком "Записать"
	И     В открытой форме я нажимаю на кнопку с заголовком "Сформировать отчет с вертикальной чертой"


	#Тогда Я задаю системные параметры считывания макета НачСтр 1 НачКол 1 КолСтр 5 КолКол 6
	И     я нажимаю на кнопку Vanessa-ADD "Забыть состояние формы TestClient"
	И     я нажимаю на кнопку Vanessa-ADD "ПолучитьИзмененияФормыGherkin"


	Тогда В реквизите Vanessa-ADD "СгенерированныйСценарий" будет содержаться строка 'Предопределенный'

	И     табличный документ формы с именем "РеквизитТабличныйДокумент" стал равен:
		| 'Наименование'    | 'Предопределенный' | 'ВерсияДанных' | 'ИмяПредопределенныхДанных' | 'ПараметрЧисло' |
		| 'Тест|ДопСтрока'  | 'Нет'              | '*'            | ''                          | '1,2'           |

	И     В открытой форме я нажимаю на кнопку "Записать и закрыть"

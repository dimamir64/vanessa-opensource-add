
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РСПодчиненныйРегистратору
	Движения.РСПодчиненныйРегистратору.Записывать = Истина;
	Движения.РСПодчиненныйРегистратору.Очистить();
	Для Каждого ТекСтрокаСостав Из Состав Цикл
		Движение = Движения.РСПодчиненныйРегистратору.Добавить();
		Движение.Период = Дата;
		Движение.ПростойСправочник = ПростойСправочник;
		Движение.ПростойСправочник2 = ТекСтрокаСостав.ПростойСправочник2;
		Движение.РесурсЧисло = ТекСтрокаСостав.РеквизитЧисло;
		Движение.РеквизитБулево = ТекСтрокаСостав.РеквизитБулево;
	КонецЦикла;


	// регистр РегистрНакопления2 Приход
	Движения.РегистрНакопления2.Записывать = Истина;
	Движения.РегистрНакопления2.Очистить();
	Для Каждого ТекСтрокаСостав Из Состав Цикл
		Движение = Движения.РегистрНакопления2.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.ПростойСправочник = ПростойСправочник;
		Движение.ПростойСправочник2 = ТекСтрокаСостав.ПростойСправочник2;
		Движение.РесурсЧисло = ТекСтрокаСостав.РеквизитЧисло;
		Движение.РеквизитБулево = ТекСтрокаСостав.РеквизитБулево;
	КонецЦикла;

	// регистр РегистрБухгалтерии1 
	Движения.РегистрБухгалтерии1.Записывать = Истина;
	Движения.РегистрБухгалтерии1.Очистить();
	Для Каждого ТекСтрокаСостав Из Состав Цикл
		Движение = Движения.РегистрБухгалтерии1.Добавить();
		Движение.СчетДт = ПланыСчетов.ПланСчетов1.Счет01;
		Движение.СчетКт = ПланыСчетов.ПланСчетов1.Счет02;
		Движение.Период = Дата;
		Движение.ПростойСправочник = ПростойСправочник;
		Движение.ПростойСправочник2Дт = ТекСтрокаСостав.ПростойСправочник2;
		Движение.РесурсЧисло = ТекСтрокаСостав.РеквизитЧисло;
		Движение.РесурсЧисло1Дт = ТекСтрокаСостав.РеквизитЧисло;
		Движение.РеквизитБулево = ТекСтрокаСостав.РеквизитБулево;
		
		Движение.СубконтоДт.Вставить(ПланыВидовХарактеристик.ВидыСубконто1.Субконто1, ПростойСправочник);
		Движение.СубконтоКт.Вставить(ПланыВидовХарактеристик.ВидыСубконто1.Субконто2, ТекСтрокаСостав.ПростойСправочник2);
		Движение.СубконтоКт.Вставить(ПланыВидовХарактеристик.ВидыСубконто1.Субконто1, ПростойСправочник);
		
		Движение = Движения.РегистрБухгалтерии1.Добавить();
		Движение.СчетДт = ПланыСчетов.ПланСчетов1.СчетБезСубконто;
		Движение.Период = Дата;
		Движение.ПростойСправочник = ПростойСправочник;
		Движение.ПростойСправочник2Кт = ТекСтрокаСостав.ПростойСправочник2;
		Движение.РесурсЧисло = ТекСтрокаСостав.РеквизитЧисло;
		Движение.РесурсЧисло1Кт = ТекСтрокаСостав.РеквизитЧисло;
		Движение.РеквизитБулево = ТекСтрокаСостав.РеквизитБулево;
		
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

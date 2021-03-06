
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РегистрНакопленияОбороты 
	Движения.РегистрНакопленияОбороты.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ Из ТЧ Цикл
		Движение = Движения.РегистрНакопленияОбороты.Добавить();
		Движение.Период = Дата;
		Движение.Измерение1 = ТекСтрокаТЧ.Реквизит1;
		Движение.РесурсЧисло1 = ТекСтрокаТЧ.РесурсЧисло1;
	КонецЦикла;

	// регистр РегистрНакопленияОстатки Приход
	Движения.РегистрНакопленияОстатки.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ Из ТЧ Цикл
		Движение = Движения.РегистрНакопленияОстатки.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Измерение1 = ТекСтрокаТЧ.Реквизит1;
		Движение.РесурсЧисло1 = ТекСтрокаТЧ.РесурсЧисло1;
	КонецЦикла;

	// регистр РегистрНакопленияОстатки Расход
	Движения.РегистрНакопленияОстатки.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ Из ТЧ Цикл
		Движение = Движения.РегистрНакопленияОстатки.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Измерение1 = ТекСтрокаТЧ.Реквизит1;
		Движение.РесурсЧисло1 = ТекСтрокаТЧ.РесурсЧисло1;
	КонецЦикла;

	// регистр РСПодчиненРегистраторуПериодический
	Движения.РСПодчиненРегистраторуПериодический.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ Из ТЧ Цикл
		Движение = Движения.РСПодчиненРегистраторуПериодический.Добавить();
		Движение.Период = Дата;
		Движение.Измерение1 = ТекСтрокаТЧ.Реквизит1;
		Движение.РесурсЧисло1 = ТекСтрокаТЧ.РесурсЧисло1;
	КонецЦикла;

	// регистр РегистрБухгалтерии1 
	Движения.РегистрБухгалтерии1.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ Из ТЧ Цикл
		Движение = Движения.РегистрБухгалтерии1.Добавить();
		Движение.СчетДт = ПланыСчетов.ПланСчетов1.Счет01;
		Движение.СчетКт = ПланыСчетов.ПланСчетов1.Счет02;
		Движение.Период = Дата;
		Движение.ПростойСправочник = РеквизитПростойСправочник;
		Движение.ПростойСправочник2Дт = РеквизитПростойСправочник2;
		Движение.ПростойСправочник2Кт = РеквизитПростойСправочник2;
		Движение.РесурсЧисло = ТекСтрокаТЧ.РесурсЧисло;
		Движение.РесурсЧисло1Дт = ТекСтрокаТЧ.РесурсЧисло1;
		Движение.РесурсЧисло1Кт = ТекСтрокаТЧ.РесурсЧисло1;
		Движение.РеквизитБулево = Истина;
		Движение.СубконтоДт[ПланыВидовХарактеристик.ВидыСубконто1.Субконто1] = РеквизитПростойСправочник;
		Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто1.Субконто2] = РеквизитПростойСправочник2;
		Движение.СубконтоКт[ПланыВидовХарактеристик.ВидыСубконто1.Субконто1] = РеквизитПростойСправочник;
	КонецЦикла;

	// регистр РегистрРасчета1
	Движения.РегистрРасчета1.Записывать = Истина;
	Для Каждого ТекСтрокаТЧ Из ТЧ Цикл
		Движение = Движения.РегистрРасчета1.Добавить();
		Движение.Сторно = Ложь;
		Движение.ВидРасчета = ПланыВидовРасчета.ПланВидовРасчета1.Предопределенный;
		Движение.ПериодРегистрации = Дата;
		Движение.ПростойСправочник = РеквизитПростойСправочник;
		Движение.РесурсЧисло = ТекСтрокаТЧ.РесурсЧисло;
		Движение.РеквизитБулево = ИСТИНА;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

﻿
Процедура ОбработкаПроверкиЗаполнения(Отказ, ПроверяемыеРеквизиты)
	Если Не ОбъектСистемы.ВестиВариантыОбъектов Тогда
		ПроверяемыеРеквизиты.Удалить(ПроверяемыеРеквизиты.Найти("ВариантОбъекта"));
	КонецЕсли;
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	Если РежимЗаписи = РежимЗаписиДокумента.Запись Тогда
		Отказ = Не ПроверитьЗаполнение();
	КонецЕсли;
	
	ИнтерактивноеДействие = Неопределено;
	ЭтотОбъект.ДополнительныеСвойства.Свойство("ИнтерактивноеДействие", ИнтерактивноеДействие);
	
	Если Ссылка.Пустая() 
		Или ПустаяСтрока(Автор) Тогда
		ТекущийПользователь = ПользователиИнформационнойБазы.ТекущийПользователь();
		
		Автор = СтрШаблон("%1_%2", ?(ПустаяСтрока(ТекущийПользователь.ПолноеИмя), ТекущийПользователь.Имя, ТекущийПользователь.ПолноеИмя), ТекущийПользователь.УникальныйИдентификатор);
	КонецЕсли;
	
	Если Не ВариантОбъекта.Пустая()
		И Не ОбъектСистемы.ВестиВариантыОбъектов Тогда
		ВариантОбъекта = Неопределено;
	КонецЕсли;
	
	Если ЭтоНовый() Тогда
		УстановитьНовыйНомер();
	КонецЕсли;
	
	Если ОбъектСистемы.ТипОбъекта = Справочники.ТипыОбъектов.Документ Тогда
		Наименование = СтрШаблон("%1 %2%3 от %4", ОбъектСистемы, ?(ВариантОбъекта.Пустая(), "", СтрШаблон("(%1) ", НРег(ВариантОбъекта))), Номер, Дата);
	КонецЕсли;
	
	ДополнительныеСвойства.Вставить("ЭтоНовый", ЭтоНовый());
	ДополнительныеСвойства.Вставить("РежимЗаписи", РежимЗаписи);
	ДополнительныеСвойства.Вставить("РежимПроведения", РежимПроведения);
КонецПроцедуры

Процедура ПриЗаписи(Отказ)
	Если ПометкаУдаления
		Или ДополнительныеСвойства.РежимЗаписи = РежимЗаписиДокумента.ОтменаПроведения Тогда
		Возврат;
	КонецЕсли;
	
	ТаблицаКолонок = Неопределено;
	СохранениеКолонок = Неопределено;
	ТаблицыОбъекта = Неопределено;
	СохранениеТаблиц = Неопределено;
	ЭтоНовый = Неопределено;
	
	ЭтотОбъект.ДополнительныеСвойства.Свойство("ТаблицаКолонок", ТаблицаКолонок);
	ЭтотОбъект.ДополнительныеСвойства.Свойство("СохранениеКолонок", СохранениеКолонок);
	ЭтотОбъект.ДополнительныеСвойства.Свойство("ТаблицыОбъекта", ТаблицыОбъекта);
	ЭтотОбъект.ДополнительныеСвойства.Свойство("СохранениеТаблиц", СохранениеТаблиц);
	ЭтотОбъект.ДополнительныеСвойства.Свойство("ЭтоНовый", ЭтоНовый);
	
	Если ТаблицыОбъекта = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если ЭтотОбъект.ОбъектСистемы.ВестиВариантыОбъектов Тогда
		Если ЗначениеЗаполнено(ЭтотОбъект.ВариантОбъекта) Тогда
			Если ЗначениеЗаполнено(ЭтотОбъект.Корректировка) Тогда
				Алгоритм = ЭтотОбъект.ВариантОбъекта.АлгоритмЗаписиКорректировки;
			Иначе
				Алгоритм = ЭтотОбъект.ВариантОбъекта.АлгоритмЗаписи;
			КонецЕсли;
		Иначе
			х = 3 / 0; // хз че происходит, не указали вариант объекта хотя должны были
		КонецЕсли;
	Иначе
		Если ЗначениеЗаполнено(ЭтотОбъект.Корректировка) Тогда
			Алгоритм = ЭтотОбъект.ОбъектСистемы.АлгоритмЗаписиКорректировки;
		Иначе
			Алгоритм = ЭтотОбъект.ОбъектСистемы.АлгоритмЗаписи;
		КонецЕсли;
	КонецЕсли;
	
	Если ЗначениеЗаполнено(Алгоритм) Тогда
		Если ПустаяСтрока(Алгоритм.ТекстАлгоритма) Тогда
			ОбщийМодуль = Алгоритм.ОбщийМодуль;
			
			Если Метаданные.ОбщиеМодули.Найти(ОбщийМодуль) = Неопределено Тогда
				Сообщить("Не найден общий модуль: " + ОбщийМодуль);
			Иначе
				ПроцедураМодуля = Алгоритм.ПроцедураМодуля;
				ПараметрыПроцедуры = Алгоритм.ПараметрыПроцедуры;
				
				Выполнить(СтрШаблон("%1.%2(%3)", ОбщийМодуль, ПроцедураМодуля, ПараметрыПроцедуры));
			КонецЕсли;
		Иначе
			Выполнить(Алгоритм.ТекстАлгоритма);
		КонецЕсли;
	КонецЕсли;
	
	//Для Каждого СохранениеКолонки Из СохранениеКолонок Цикл
	//	Если Не СохранениеКолонки.Значение Тогда
	//		ТаблицаКолонок.Удалить(ТаблицаКолонок.Найти(СохранениеКолонки.Ключ, "Колонка"));
	//	КонецЕсли;
	//КонецЦикла;
	
	РегистрДляХранения = "ХранилищеЗначенийКолонокОбъектов"; //ЭтотОбъект.ОбъектСистемы.РегистрДляХранения;
	
	ЗапретитьЗаписьИзменений = Ложь;
	ДатаИзменений = ?(ЭтоНовый, Дата, ТекущаяДатаСеанса());
	
	Если РаботаСОбъектомНаСервере.ВестиКорректировки(ОбъектСистемы, ВариантОбъекта) Тогда
		Если Корректировка.Пустая() Тогда
			Владелец = Ссылка;
		Иначе
			Владелец = Корректировка;
		КонецЕсли;
		
		Запрос = Новый Запрос;
		Запрос.УстановитьПараметр("Владелец", Владелец);
		Запрос.УстановитьПараметр("Источник", Ссылка);
		Запрос.УстановитьПараметр("Период", Дата);
		Запрос.Текст =
		"ВЫБРАТЬ
		|	ХранилищеЗначенийКолонокОбъектовСрезПоследних.Период КАК Период
		|ИЗ
		|	РегистрСведений.ХранилищеЗначенийКолонокОбъектов.СрезПоследних(, Владелец = &Владелец) КАК ХранилищеЗначенийКолонокОбъектовСрезПоследних
		|ГДЕ
		|	ХранилищеЗначенийКолонокОбъектовСрезПоследних.Источник <> &Источник
		|	И ХранилищеЗначенийКолонокОбъектовСрезПоследних.Период >= &Период";
		Результат = Запрос.Выполнить();
		
		Если Не Результат.Пустой() Тогда
			ЗапретитьЗаписьИзменений = Истина;
		КонецЕсли;
	Иначе
		Владелец = Ссылка;
	КонецЕсли;
	
	
	
	//ТаблицаКолонок.ЗаполнитьЗначения(Истина, "Активность");
	//ТаблицаКолонок.ЗаполнитьЗначения(ДатаИзменений, "Период");
	ТаблицаКолонок.ЗаполнитьЗначения(Владелец, "Владелец");
	ТаблицаКолонок.ЗаполнитьЗначения(Владелец, "Объект");
	
	
	
	НаборЗаписей = РегистрыСведений.АктивностьСтрокТаблиц.СоздатьНаборЗаписей();
	НаборЗаписей.Отбор.Период.Установить(ДатаИзменений);
	НаборЗаписей.Отбор.Владелец.Установить(Владелец);
	
	Для Каждого ТаблицаОбъекта Из ТаблицыОбъекта Цикл
		НовыеСтрокиТаблицы = Новый Массив;
		
		//Если СохранениеТаблиц.Получить(ТаблицаОбъекта.Ключ) Тогда
		Если Истина Тогда
			Запрос = Новый Запрос;
			
			ЕстьКолонкаСтрокаТаблицы = ТаблицаОбъекта.Значение.Колонки.Найти("СтрокаТаблицы") <> Неопределено;
			
			Если ЕстьКолонкаСтрокаТаблицы Тогда
				Запрос.УстановитьПараметр("ЗанятыеСсылки", ТаблицаОбъекта.Значение.ВыгрузитьКолонку("СтрокаТаблицы"));
			Иначе
				Запрос.УстановитьПараметр("ЗанятыеСсылки", Новый Массив);
			КонецЕсли;
			
			Запрос.Текст =
			"ВЫБРАТЬ ПЕРВЫЕ " + ТаблицаОбъекта.Значение.Количество() + "
			|	СтрокиТаблиц.Ссылка КАК СтрокаТаблицы
			|ИЗ
			|	Справочник.СтрокиТаблиц КАК СтрокиТаблиц
			|ГДЕ
			|	НЕ СтрокиТаблиц.Ссылка В (&ЗанятыеСсылки)
			|
			|УПОРЯДОЧИТЬ ПО
			|	СтрокиТаблиц.Код";
			СтрокиТаблицы = Запрос.Выполнить().Выгрузить().ВыгрузитьКолонку("СтрокаТаблицы");
			
			СоответствиеСсылок = Новый Соответствие;
			
			Для Каждого СтрокаТаблицаОбъекта Из ТаблицаОбъекта.Значение Цикл
				НомерСтроки = ТаблицаОбъекта.Значение.Индекс(СтрокаТаблицаОбъекта);
				СтрокаТаблицыСсылка = СоответствиеСсылок.Получить(НомерСтроки);
				
				Для Каждого СтрокаКолонка Из ТаблицаОбъекта.Ключ.Колонки Цикл
					//Если Не СтрокаКолонка.Сохранять Тогда
					//	Продолжить;
					//КонецЕсли;
					
					Если СтрокаТаблицыСсылка = Неопределено Тогда
						Если ЕстьКолонкаСтрокаТаблицы
							И ЗначениеЗаполнено(СтрокаТаблицаОбъекта.СтрокаТаблицы) Тогда
							СтрокаТаблицыСсылка = СтрокаТаблицаОбъекта.СтрокаТаблицы;
						ИначеЕсли СтрокиТаблицы.Количество() = 0 Тогда
							СтрокаТаблицыОбъект = Справочники.СтрокиТаблиц.СоздатьЭлемент();
							СтрокаТаблицыОбъект.Записать();
							СтрокаТаблицыСсылка = СтрокаТаблицыОбъект.Ссылка;
						Иначе
							СтрокаТаблицыСсылка = СтрокиТаблицы[0];
							СтрокиТаблицы.Удалить(0);
						КонецЕсли;
						
						СоответствиеСсылок.Вставить(НомерСтроки, СтрокаТаблицыСсылка);
						НовыеСтрокиТаблицы.Добавить(СтрокаТаблицыСсылка);
					КонецЕсли;
					
					НоваяСтрока = ТаблицаКолонок.Добавить();
					//НоваяСтрока.Активность = Истина;
					//НоваяСтрока.Период = ДатаИзменений;
					НоваяСтрока.Владелец = Владелец;
					НоваяСтрока.ОбъектСистемы = ТаблицаОбъекта.Ключ;
					НоваяСтрока.Объект = СтрокаТаблицыСсылка;
					НоваяСтрока.Колонка = СтрокаКолонка.Колонка;
					НоваяСтрока.Значение = СтрокаТаблицаОбъекта[СтрокаКолонка.Колонка.СистемноеНаименование];
				КонецЦикла;
				
				//НоваяЗапись = НаборЗаписей.Добавить();
				//НоваяЗапись.Активность = Истина;
				//НоваяЗапись.Период = ДатаИзменений;
				//НоваяЗапись.Владелец = Владелец;
				//НоваяЗапись.ОбъектСистемы = ТаблицаОбъекта.Ключ;
				//НоваяЗапись.СтрокаТаблицы = СтрокаТаблицыСсылка;
				//НоваяЗапись.АктивностьСтроки = Истина;
			КонецЦикла;
		КонецЕсли;
		
		Запрос = Новый Запрос;
		Запрос.УстановитьПараметр("НовыеСтрокиТаблицы", НовыеСтрокиТаблицы);
		Запрос.УстановитьПараметр("Период", ДатаИзменений);
		Запрос.УстановитьПараметр("Владелец", Владелец);
		Запрос.УстановитьПараметр("ОбъектСистемы", ТаблицаОбъекта.Ключ);
		Запрос.УстановитьПараметр("Источник", Ссылка);
		Запрос.УстановитьПараметр("Автор", Автор);
		Запрос.Текст = ПолучитьЗапросИзменениеАктивностиСтрокТаблиц();
		
		Результат = Запрос.Выполнить();
		
		Если Не Результат.Пустой() Тогда
			Результат = Результат.Выбрать();
			
			Пока Результат.Следующий() Цикл
				ЗаполнитьЗначенияСвойств(НаборЗаписей.Добавить(), Результат);
			КонецЦикла;
		КонецЕсли;
	КонецЦикла;
	
	Если НаборЗаписей.Количество() > 0 Тогда
		Если ЗапретитьЗаписьИзменений Тогда
			Сообщить("Внесите изменения в последнюю корректировку или создайте новую.");
			
			Отказ = Истина;
			
			Возврат;
		Иначе
			НаборЗаписей.Записать();
		КонецЕсли;
	КонецЕсли;
	
	
	
	//НаборЗаписей = РегистрыСведений.ХранилищеЗначенийКолонокОбъектов.СоздатьНаборЗаписей();
	//НаборЗаписей.Отбор.Регистратор.Установить(Ссылка);
	//
	//Для Каждого СтрокаТаблицаКолонок Из ТаблицаКолонок Цикл
	//	ЗаполнитьЗначенияСвойств(НаборЗаписей.Добавить(), СтрокаТаблицаКолонок);
	//КонецЦикла;
	//
	//НаборЗаписей.Записать();
	
	
	
	Запрос = Новый Запрос;
	Запрос.УстановитьПараметр("УникальныйИдентификатор", Новый УникальныйИдентификатор);
	Запрос.УстановитьПараметр("ТаблицаКолонок", ТаблицаКолонок);
	Запрос.УстановитьПараметр("Период", ДатаИзменений);
	Запрос.УстановитьПараметр("Владелец", Владелец);
	Запрос.УстановитьПараметр("Источник", Ссылка);
	Запрос.УстановитьПараметр("Автор", Автор);
	Запрос.Текст = ПолучитьЗапросИзменениеЗначенийКолонокОбъектов(РегистрДляХранения);
	
	Результат = Запрос.Выполнить();
	
	Если Не Результат.Пустой() Тогда
		НаборЗаписей = РегистрыСведений.ХранилищеЗначенийКолонокОбъектов.СоздатьНаборЗаписей();
		НаборЗаписей.Отбор.Период.Установить(ДатаИзменений);
		НаборЗаписей.Отбор.Владелец.Установить(Владелец);
		
		Результат = Результат.Выбрать();
		
		Пока Результат.Следующий() Цикл
			ЗаполнитьЗначенияСвойств(НаборЗаписей.Добавить(), Результат);
		КонецЦикла;
		
		Если ЗапретитьЗаписьИзменений Тогда
			Сообщить("Внесите изменения в последнюю корректировку или создайте новую.");
			
			Отказ = Истина;
			
			Возврат;
		Иначе
			НаборЗаписей.Записать();
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	РаботаСОбъектомНаСервере.ОбработкаПроведения(Отказ, РежимПроведения, ЭтотОбъект);
КонецПроцедуры

//Процедура ОбработкаУдаленияПроведения(Отказ)
//	ТипРСНЗАктивностьСтрокТаблиц = Тип("РегистрСведенийНаборЗаписей.АктивностьСтрокТаблиц");
//	ТипРСНЗХранилищеЗначенийКолонокОбъектов = Тип("РегистрСведенийНаборЗаписей.ХранилищеЗначенийКолонокОбъектов");
//	
//	Для Каждого Движение Из ЭтотОбъект.Движения Цикл
//		ТипЗнчДвижение = ТипЗнч(Движение);
//		
//		Если ТипЗнчДвижение = ТипРСНЗАктивностьСтрокТаблиц
//			Или ТипЗнчДвижение = ТипРСНЗХранилищеЗначенийКолонокОбъектов Тогда
//			Продолжить;
//		КонецЕсли;
//		
//		Движение.Записать();
//	КонецЦикла;
//КонецПроцедуры

Функция ПолучитьЗапросИзменениеАктивностиСтрокТаблиц()
	Возврат
	
	"ВЫБРАТЬ
	|	АктивностьСтрокТаблицСрезПоследних.СтрокаТаблицы КАК СтрокаТаблицы,
	|	АктивностьСтрокТаблицСрезПоследних.АктивностьСтроки КАК АктивностьСтрокиСтарая,
	|	ЛОЖЬ КАК АктивностьСтрокиНовая
	|ПОМЕСТИТЬ ВТ_СтрокиТаблицы
	|ИЗ
	|	РегистрСведений.АктивностьСтрокТаблиц.СрезПоследних(
	|			,
	|			Владелец = &Владелец
	|				И ОбъектСистемы = &ОбъектСистемы) КАК АктивностьСтрокТаблицСрезПоследних
	|
	|ОБЪЕДИНИТЬ ВСЕ
	|
	|ВЫБРАТЬ
	|	СтрокиТаблиц.Ссылка,
	|	ЛОЖЬ,
	|	ИСТИНА
	|ИЗ
	|	Справочник.СтрокиТаблиц КАК СтрокиТаблиц
	|ГДЕ
	|	СтрокиТаблиц.Ссылка В(&НовыеСтрокиТаблицы)
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	&Период КАК Период,
	|	&Владелец КАК Владелец,
	|	&ОбъектСистемы КАК ОбъектСистемы,
	|	ВТ_СтрокиТаблицы.СтрокаТаблицы КАК СтрокаТаблицы,
	|	МАКСИМУМ(ВТ_СтрокиТаблицы.АктивностьСтрокиНовая) КАК АктивностьСтроки,
	|	&Источник КАК Источник,
	|	&Автор КАК Автор
	|ИЗ
	|	ВТ_СтрокиТаблицы КАК ВТ_СтрокиТаблицы
	|
	|СГРУППИРОВАТЬ ПО
	|	ВТ_СтрокиТаблицы.СтрокаТаблицы
	|
	|ИМЕЮЩИЕ
	|	МАКСИМУМ(ВТ_СтрокиТаблицы.АктивностьСтрокиСтарая) <> МАКСИМУМ(ВТ_СтрокиТаблицы.АктивностьСтрокиНовая)";
КонецФункции

Функция ПолучитьЗапросИзменениеЗначенийКолонокОбъектов(РегистрДляХранения)
	Возврат
	
	СтрШаблон("ВЫБРАТЬ
	|	ТаблицаКолонок.Владелец КАК Владелец,
	|	ТаблицаКолонок.ОбъектСистемы КАК ОбъектСистемы,
	|	ТаблицаКолонок.Объект КАК Объект,
	|	ТаблицаКолонок.Колонка КАК Колонка,
	|	ТаблицаКолонок.Значение КАК Значение
	|ПОМЕСТИТЬ ВТ_ТаблицаКолонок
	|ИЗ
	|	&ТаблицаКолонок КАК ТаблицаКолонок
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	ХранилищеЗначенийРеквизитовОбъектовСрезПоследних.Владелец КАК Владелец,
	|	ХранилищеЗначенийРеквизитовОбъектовСрезПоследних.ОбъектСистемы КАК ОбъектСистемы,
	|	ХранилищеЗначенийРеквизитовОбъектовСрезПоследних.Объект КАК Объект,
	|	ХранилищеЗначенийРеквизитовОбъектовСрезПоследних.Колонка КАК Колонка,
	|	ХранилищеЗначенийРеквизитовОбъектовСрезПоследних.Значение КАК ЗначениеСтарое,
	|	NULL КАК ЗначениеНовое
	|ПОМЕСТИТЬ ВТ_Итог
	|ИЗ
	|	РегистрСведений.%1.СрезПоследних(
	|			,
	|			(ОбъектСистемы, Объект, Владелец) В
	|				(ВЫБРАТЬ
	|					ВТ_ТаблицаКолонок.ОбъектСистемы,
	|					ВТ_ТаблицаКолонок.Объект,
	|					ВТ_ТаблицаКолонок.Владелец
	|				ИЗ
	|					ВТ_ТаблицаКолонок)) КАК ХранилищеЗначенийРеквизитовОбъектовСрезПоследних
	|
	|ОБЪЕДИНИТЬ ВСЕ
	|
	|ВЫБРАТЬ
	|	ВТ_ТаблицаКолонок.Владелец,
	|	ВТ_ТаблицаКолонок.ОбъектСистемы,
	|	ВТ_ТаблицаКолонок.Объект,
	|	ВТ_ТаблицаКолонок.Колонка,
	|	NULL,
	|	ВТ_ТаблицаКолонок.Значение
	|ИЗ
	|	ВТ_ТаблицаКолонок КАК ВТ_ТаблицаКолонок
	|;
	|
	|////////////////////////////////////////////////////////////////////////////////
	|ВЫБРАТЬ
	|	&Период КАК Период,
	|	ВТ_Итог.Владелец КАК Владелец,
	|	ВТ_Итог.ОбъектСистемы КАК ОбъектСистемы,
	|	ВТ_Итог.Объект КАК Объект,
	|	ВТ_Итог.Колонка КАК Колонка,
	|	МАКСИМУМ(ВТ_Итог.ЗначениеНовое) КАК Значение,
	|	&Источник КАК Источник,
	|	&Автор КАК Автор
	|ИЗ
	|	ВТ_Итог КАК ВТ_Итог
	|
	|СГРУППИРОВАТЬ ПО
	|	ВТ_Итог.Владелец,
	|	ВТ_Итог.ОбъектСистемы,
	|	ВТ_Итог.Объект,
	|	ВТ_Итог.Колонка
	|
	|ИМЕЮЩИЕ
	|	НЕ МАКСИМУМ(ВТ_Итог.ЗначениеНовое) ЕСТЬ NULL И
	|	ЕСТЬNULL(МАКСИМУМ(ВТ_Итог.ЗначениеСтарое), &УникальныйИдентификатор) <> ЕСТЬNULL(МАКСИМУМ(ВТ_Итог.ЗначениеНовое), &УникальныйИдентификатор)", РегистрДляХранения);
КонецФункции

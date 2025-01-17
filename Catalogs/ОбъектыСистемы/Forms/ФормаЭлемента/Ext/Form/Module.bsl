﻿
#Область СтандартныеВариантыОбъектовФормы

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	ГУИД = XMLСтрока(ТекущийОбъект.Ссылка);
	
	Если ТекущийОбъект.Источники.Количество() > 0 Тогда
		ВариантыОбъектовСтрокиПервогоУровня = Новый Соответствие;
		
		ИсточникиЭлементы = Источники.ПолучитьЭлементы();
		
		Для Каждого СтрокаИсточника Из ТекущийОбъект.Источники Цикл
			Ключ = СтрокаИсточника.Источник.Код + СтрокаИсточника.ВариантОбъектаИсточника.Код;
			
			ЭлементыВторогоУровня = ВариантыОбъектовСтрокиПервогоУровня.Получить(Ключ);
			
			Если ЭлементыВторогоУровня = Неопределено Тогда
				ЭлементПервогоУровня = ИсточникиЭлементы.Добавить();
				ЭлементПервогоУровня.Источник = СтрокаИсточника.Источник;
				ЭлементПервогоУровня.ВариантОбъектаИсточника = СтрокаИсточника.ВариантОбъектаИсточника;
				ЭлементПервогоУровня.ВариантыОбъектовИсточникаВедутся = СтрокаИсточника.Источник.ВестиВариантыОбъектов;
				ЭлементПервогоУровня.Исключить = СтрокаИсточника.ИсключитьИсточник;
				
				ЭлементыВторогоУровня = ЭлементПервогоУровня.ПолучитьЭлементы();
				
				ВариантыОбъектовСтрокиПервогоУровня.Вставить(Ключ, ЭлементыВторогоУровня);
			КонецЕсли;
			
			ЭлементВторогоУровня = ЭлементыВторогоУровня.Добавить();
			ЭлементВторогоУровня.ВариантОбъекта = СтрокаИсточника.ВариантОбъекта;
			ЭлементВторогоУровня.Исключить = СтрокаИсточника.ИсключитьВариантОбъекта;
			ЭлементВторогоУровня.Уровень = 1;
		КонецЦикла;
	КонецЕсли;
	
	Если ТекущийОбъект.Основания.Количество() > 0 Тогда
		ВариантыОбъектовСтрокиПервогоУровня = Новый Соответствие;
		
		ОснованияЭлементы = Основания.ПолучитьЭлементы();
		
		Для Каждого СтрокаОснования Из ТекущийОбъект.Основания Цикл
			Ключ = СтрокаОснования.Основание.Код + СтрокаОснования.ВариантОбъектаОснования.Код;
			
			ЭлементыВторогоУровня = ВариантыОбъектовСтрокиПервогоУровня.Получить(Ключ);
			
			Если ЭлементыВторогоУровня = Неопределено Тогда
				ЭлементПервогоУровня = ОснованияЭлементы.Добавить();
				ЭлементПервогоУровня.Основание = СтрокаОснования.Основание;
				ЭлементПервогоУровня.ВариантОбъектаОснования = СтрокаОснования.ВариантОбъектаОснования;
				ЭлементПервогоУровня.ВариантыОбъектовОснованияВедутся = СтрокаОснования.Основание.ВестиВариантыОбъектов;
				ЭлементПервогоУровня.Исключить = СтрокаОснования.ИсключитьОснование;
				
				ЭлементыВторогоУровня = ЭлементПервогоУровня.ПолучитьЭлементы();
				
				ВариантыОбъектовСтрокиПервогоУровня.Вставить(Ключ, ЭлементыВторогоУровня);
			КонецЕсли;
			
			ЭлементВторогоУровня = ЭлементыВторогоУровня.Добавить();
			ЭлементВторогоУровня.ВариантОбъекта = СтрокаОснования.ВариантОбъекта;
			ЭлементВторогоУровня.Исключить = СтрокаОснования.ИсключитьВариантОбъекта;
			ЭлементВторогоУровня.Уровень = 1;
		КонецЦикла;
	КонецЕсли;
	
	Если ТекущийОбъект.Колонки.Количество() > 0 Тогда
		ВариантыОбъектовСтрокиПервогоУровня = Новый Соответствие;
		
		КолонкиЭлементы = Колонки.ПолучитьЭлементы();
		
		Для Каждого СтрокаКолонки Из ТекущийОбъект.Колонки Цикл
			ЭлементыВторогоУровня = ВариантыОбъектовСтрокиПервогоУровня.Получить(СтрокаКолонки.ВариантОбъекта);
			
			Если ЭлементыВторогоУровня = Неопределено Тогда
				ЭлементПервогоУровня = КолонкиЭлементы.Добавить();
				ЭлементПервогоУровня.ВариантОбъекта = СтрокаКолонки.ВариантОбъекта;
				ЭлементыВторогоУровня = ЭлементПервогоУровня.ПолучитьЭлементы();
				
				ВариантыОбъектовСтрокиПервогоУровня.Вставить(СтрокаКолонки.ВариантОбъекта, ЭлементыВторогоУровня);
			КонецЕсли;
			
			ЭлементВторогоУровня = ЭлементыВторогоУровня.Добавить();
			ЗаполнитьЗначенияСвойств(ЭлементВторогоУровня, СтрокаКолонки);
			ЭлементВторогоУровня.Уровень = 1;
		КонецЦикла;
	КонецЕсли;
	
	Если ТекущийОбъект.Таблицы.Количество() > 0 Тогда
		ВариантыОбъектовСтрокиПервогоУровня = Новый Соответствие;
		
		ТаблицыЭлементы = Таблицы.ПолучитьЭлементы();
		
		Для Каждого СтрокаТаблицы Из ТекущийОбъект.Таблицы Цикл
			ЭлементыВторогоУровня = ВариантыОбъектовСтрокиПервогоУровня.Получить(СтрокаТаблицы.ВариантОбъекта);
			
			Если ЭлементыВторогоУровня = Неопределено Тогда
				ЭлементПервогоУровня = ТаблицыЭлементы.Добавить();
				ЭлементПервогоУровня.ВариантОбъекта = СтрокаТаблицы.ВариантОбъекта;
				ЭлементыВторогоУровня = ЭлементПервогоУровня.ПолучитьЭлементы();
				
				ВариантыОбъектовСтрокиПервогоУровня.Вставить(СтрокаТаблицы.ВариантОбъекта, ЭлементыВторогоУровня);
			КонецЕсли;
			
			ЭлементВторогоУровня = ЭлементыВторогоУровня.Добавить();
			ЗаполнитьЗначенияСвойств(ЭлементВторогоУровня, СтрокаТаблицы);
			ЭлементВторогоУровня.Уровень = 1;
		КонецЦикла;
	КонецЕсли;
	
	Если ТекущийОбъект.РазрезыДанных.Количество() > 0 Тогда
		ВариантыОбъектовСтрокиПервогоУровня = Новый Соответствие;
		
		РазрезыДанныхЭлементы = РазрезыДанных.ПолучитьЭлементы();
		
		Для Каждого СтрокаРазрезыДанных Из ТекущийОбъект.РазрезыДанных Цикл
			ЭлементыВторогоУровня = ВариантыОбъектовСтрокиПервогоУровня.Получить(СтрокаРазрезыДанных.ВариантОбъекта);
			
			Если ЭлементыВторогоУровня = Неопределено Тогда
				ЭлементПервогоУровня = РазрезыДанныхЭлементы.Добавить();
				ЭлементПервогоУровня.ВариантОбъекта = СтрокаРазрезыДанных.ВариантОбъекта;
				ЭлементыВторогоУровня = ЭлементПервогоУровня.ПолучитьЭлементы();
				
				ВариантыОбъектовСтрокиПервогоУровня.Вставить(СтрокаРазрезыДанных.ВариантОбъекта, ЭлементыВторогоУровня);
			КонецЕсли;
			
			РазрезыДанныхНовыйЭлемент = ЭлементыВторогоУровня.Добавить();
			РазрезыДанныхНовыйЭлемент.Уровень = 1;
			ЗаполнитьЗначенияСвойств(РазрезыДанныхНовыйЭлемент, СтрокаРазрезыДанных);
			
			КолонкиРазрезовДанныхЭлементы = РазрезыДанныхНовыйЭлемент.ПолучитьЭлементы();
			
			КолонкиРегистраМассив = ТекущийОбъект.КолонкиРазрезовДанных.НайтиСтроки(Новый Структура("РазрезДанных, ВариантОбъекта", СтрокаРазрезыДанных.РазрезДанных, СтрокаРазрезыДанных.ВариантОбъекта));
			
			Для Каждого СтрокаКолонкиРегистраМассив Из КолонкиРегистраМассив Цикл
				КолонкиРазрезовДанныхНовыйЭлемент = КолонкиРазрезовДанныхЭлементы.Добавить();
				ЗаполнитьЗначенияСвойств(КолонкиРазрезовДанныхНовыйЭлемент, СтрокаКолонкиРегистраМассив, , "РазрезДанных, ВариантОбъекта");
				КолонкиРазрезовДанныхНовыйЭлемент.Таблица = СтрокаРазрезыДанных.Таблица;
				КолонкиРазрезовДанныхНовыйЭлемент.Уровень = 2;
			КонецЦикла;
		КонецЦикла
	КонецЕсли;
	
	Если Не ПустаяСтрока(Объект.ЦветXML) Тогда
		Элементы.ЦветXML.ЦветФона = СериализаторXDTO.XMLЗначение(Тип("Цвет"), Объект.ЦветXML);
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	НастройкаЭлементовФормы();
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	ТекущийОбъект.Источники.Очистить();
	
	Для Каждого ЭлементПервогоУровня Из Источники.ПолучитьЭлементы() Цикл
		Если ЭлементПервогоУровня.Исключить Тогда
			НоваяСтрока = ТекущийОбъект.Источники.Добавить();
			НоваяСтрока.Источник = ЭлементПервогоУровня.Источник;
			НоваяСтрока.ВариантОбъектаИсточника = ?(ЭлементПервогоУровня.ВариантыОбъектовИсточникаВедутся, ЭлементПервогоУровня.ВариантОбъектаИсточника, Неопределено);
			НоваяСтрока.ИсключитьИсточник = ЭлементПервогоУровня.Исключить;
			
			Продолжить;
		КонецЕсли;
		
		Для Каждого ЭлементВторогоУровня Из ЭлементПервогоУровня.ПолучитьЭлементы() Цикл
			НоваяСтрока = ТекущийОбъект.Источники.Добавить();
			НоваяСтрока.Источник = ЭлементПервогоУровня.Источник;
			НоваяСтрока.ВариантОбъектаИсточника = ?(ЭлементПервогоУровня.ВариантыОбъектовИсточникаВедутся, ЭлементПервогоУровня.ВариантОбъектаИсточника, Неопределено);
			НоваяСтрока.ИсключитьИсточник = ЭлементПервогоУровня.Исключить;
			НоваяСтрока.ВариантОбъекта = ?(ТекущийОбъект.ВестиВариантыОбъектов, ЭлементВторогоУровня.ВариантОбъекта, Неопределено);
			НоваяСтрока.ИсключитьВариантОбъекта = ЭлементВторогоУровня.Исключить;
		КонецЦикла;
	КонецЦикла;
	
	ТекущийОбъект.Основания.Очистить();
	
	Для Каждого ЭлементПервогоУровня Из Основания.ПолучитьЭлементы() Цикл
		Если ЭлементПервогоУровня.Исключить Тогда
			НоваяСтрока = ТекущийОбъект.Основания.Добавить();
			НоваяСтрока.Основание = ЭлементПервогоУровня.Основание;
			НоваяСтрока.ВариантОбъектаОснования = ?(ЭлементПервогоУровня.ВариантыОбъектовОснованияВедутся, ЭлементПервогоУровня.ВариантОбъектаОснования, Неопределено);
			НоваяСтрока.ИсключитьОснование = ЭлементПервогоУровня.Исключить;
			
			Продолжить;
		КонецЕсли;
		
		Для Каждого ЭлементВторогоУровня Из ЭлементПервогоУровня.ПолучитьЭлементы() Цикл
			НоваяСтрока = ТекущийОбъект.Основания.Добавить();
			НоваяСтрока.Основание = ЭлементПервогоУровня.Основание;
			НоваяСтрока.ВариантОбъектаОснования = ?(ЭлементПервогоУровня.ВариантыОбъектовОснованияВедутся, ЭлементПервогоУровня.ВариантОбъектаОснования, Неопределено);
			НоваяСтрока.ИсключитьОснование = ЭлементПервогоУровня.Исключить;
			НоваяСтрока.ВариантОбъекта = ?(ТекущийОбъект.ВестиВариантыОбъектов, ЭлементВторогоУровня.ВариантОбъекта, Неопределено);
			НоваяСтрока.ИсключитьВариантОбъекта = ЭлементВторогоУровня.Исключить;
		КонецЦикла;
	КонецЦикла;
	
	ТекущийОбъект.Колонки.Очистить();
	
	Для Каждого ЭлементПервогоУровня Из Колонки.ПолучитьЭлементы() Цикл
		Если Не ТекущийОбъект.ВестиВариантыОбъектов
			И Не ЭлементПервогоУровня.ВариантОбъекта.Пустая() Тогда
			Продолжить;
		КонецЕсли;
		
		Для Каждого ЭлементВторогоУровня Из ЭлементПервогоУровня.ПолучитьЭлементы() Цикл
			Если ЭлементВторогоУровня.Исключить
				И ЭлементВторогоУровня.ВариантОбъекта.Пустая() Тогда
				Продолжить;
			КонецЕсли;
			
			НоваяСтрока = ТекущийОбъект.Колонки.Добавить();
			НоваяСтрока.ВариантОбъекта = ЭлементПервогоУровня.ВариантОбъекта;
			НоваяСтрока.Колонка = ЭлементВторогоУровня.Колонка;
			НоваяСтрока.Исключить = ЭлементВторогоУровня.Исключить;
			
			Если Не ЭлементВторогоУровня.Исключить Тогда
				ЗаполнитьЗначенияСвойств(НоваяСтрока, ЭлементВторогоУровня, , "ВариантОбъекта, Колонка, Исключить");
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	
	ТекущийОбъект.Таблицы.Очистить();
	
	Для Каждого ЭлементПервогоУровня Из Таблицы.ПолучитьЭлементы() Цикл
		Если Не ТекущийОбъект.ВестиВариантыОбъектов
			И Не ЭлементПервогоУровня.ВариантОбъекта.Пустая() Тогда
			Продолжить;
		КонецЕсли;
		
		Для Каждого ЭлементВторогоУровня Из ЭлементПервогоУровня.ПолучитьЭлементы() Цикл
			Если ЭлементВторогоУровня.Исключить
				И ЭлементВторогоУровня.ВариантОбъекта.Пустая() Тогда
				Продолжить;
			КонецЕсли;
			
			НоваяСтрока = ТекущийОбъект.Таблицы.Добавить();
			НоваяСтрока.ВариантОбъекта = ЭлементПервогоУровня.ВариантОбъекта;
			НоваяСтрока.Таблица = ЭлементВторогоУровня.Таблица;
			НоваяСтрока.Исключить = ЭлементВторогоУровня.Исключить;
			
			Если Не ЭлементВторогоУровня.Исключить Тогда
				ЗаполнитьЗначенияСвойств(НоваяСтрока, ЭлементВторогоУровня, , "ВариантОбъекта, Таблица, Исключить");
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
	
	ТекущийОбъект.РазрезыДанных.Очистить();
	ТекущийОбъект.КолонкиРазрезовДанных.Очистить();
	
	Для Каждого ВариантОбъектаЭлемент Из РазрезыДанных.ПолучитьЭлементы() Цикл
		Если Не ТекущийОбъект.ВестиВариантыОбъектов
			И Не ВариантОбъектаЭлемент.ВариантОбъекта.Пустая() Тогда
			Продолжить;
		КонецЕсли;
		
		Для Каждого РазрезДанныхЭлемент Из ВариантОбъектаЭлемент.ПолучитьЭлементы() Цикл
			НоваяСтрокаРазрезыДанных = ТекущийОбъект.РазрезыДанных.Добавить();
			НоваяСтрокаРазрезыДанных.ВариантОбъекта = ВариантОбъектаЭлемент.ВариантОбъекта;
			НоваяСтрокаРазрезыДанных.РазрезДанных = РазрезДанныхЭлемент.РазрезДанных;
			НоваяСтрокаРазрезыДанных.Исключить = РазрезДанныхЭлемент.Исключить;
			
			Если Не НоваяСтрокаРазрезыДанных.Исключить Тогда
				НоваяСтрокаРазрезыДанных.КонтрольОстатков = РазрезДанныхЭлемент.КонтрольОстатков;
				НоваяСтрокаРазрезыДанных.Таблица = РазрезДанныхЭлемент.Таблица;
				
				Для Каждого КолонкаРазрезаДанныхЭлемент Из РазрезДанныхЭлемент.ПолучитьЭлементы() Цикл
					НоваяСтрокаКолонкиРазрезовДанных = ТекущийОбъект.КолонкиРазрезовДанных.Добавить();
					НоваяСтрокаКолонкиРазрезовДанных.ВариантОбъекта = ВариантОбъектаЭлемент.ВариантОбъекта;
					НоваяСтрокаКолонкиРазрезовДанных.РазрезДанных = РазрезДанныхЭлемент.РазрезДанных;
					НоваяСтрокаКолонкиРазрезовДанных.КолонкаРазрезаДанных = КолонкаРазрезаДанныхЭлемент.КолонкаРазрезаДанных;
					НоваяСтрокаКолонкиРазрезовДанных.КолонкаОбъекта = КолонкаРазрезаДанныхЭлемент.КолонкаОбъекта;
					
					Если НоваяСтрокаКолонкиРазрезовДанных.КолонкаОбъекта.Пустая()
						И Не НоваяСтрокаРазрезыДанных.Таблица.Пустая() Тогда
						НоваяСтрокаКолонкиРазрезовДанных.КолонкаТаблицы = КолонкаРазрезаДанныхЭлемент.КолонкаТаблицы;
					КонецЕсли;
				КонецЦикла;
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

#КонецОбласти

#Область КомандыФормы

&НаКлиенте
Процедура ДобавитьВариантОбъектаИсточника(Команда)
	Если Элементы.Источники.ТекущиеДанные = Неопределено Тогда
		//Если Не Объект.ВестиВариантыОбъектов Тогда
		НоваяСтрока = Источники.ПолучитьЭлементы().Добавить();
		НоваяСтрока = НоваяСтрока.ПолучитьЭлементы().Добавить();
		НоваяСтрока.Уровень = 1;
		//КонецЕсли;
	Иначе
		Если Элементы.Источники.ТекущиеДанные.Уровень = 0 Тогда
			ИсточникиЭлементы = Элементы.Источники.ТекущиеДанные.ПолучитьЭлементы();
		Иначе
			ИсточникиЭлементы = Элементы.Источники.ТекущиеДанные.ПолучитьРодителя().ПолучитьЭлементы();
		КонецЕсли;
		
		НоваяСтрока = ИсточникиЭлементы.Добавить();
		НоваяСтрока.Уровень = 1;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьИсточник(Команда)
	ИсточникиЭлементы = Источники.ПолучитьЭлементы();
	ИсточникиЭлементы.Добавить();
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьВариантОбъектаОснования(Команда)
	Если Элементы.Основания.ТекущиеДанные = Неопределено Тогда
		//Если Не Объект.ВестиВариантыОбъектов Тогда
		НоваяСтрока = Основания.ПолучитьЭлементы().Добавить();
		НоваяСтрока = НоваяСтрока.ПолучитьЭлементы().Добавить();
		НоваяСтрока.Уровень = 1;
		//КонецЕсли;
	Иначе
		Если Элементы.Основания.ТекущиеДанные.Уровень = 0 Тогда
			ОснованияЭлементы = Элементы.Основания.ТекущиеДанные.ПолучитьЭлементы();
		Иначе
			ОснованияЭлементы = Элементы.Основания.ТекущиеДанные.ПолучитьРодителя().ПолучитьЭлементы();
		КонецЕсли;
		
		НоваяСтрока = ОснованияЭлементы.Добавить();
		НоваяСтрока.Уровень = 1;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьОснование(Команда)
	ОснованияЭлементы = Основания.ПолучитьЭлементы();
	ОснованияЭлементы.Добавить();
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьВариантОбъектаКолонки(Команда)
	КолонкиЭлементы = Колонки.ПолучитьЭлементы();
	КолонкиЭлементы.Добавить();
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьКолонку(Команда)
	Если Элементы.Колонки.ТекущиеДанные = Неопределено Тогда
		//Если Не Объект.ВестиВариантыОбъектов Тогда
		НоваяСтрока = Колонки.ПолучитьЭлементы().Добавить();
		НоваяСтрока = НоваяСтрока.ПолучитьЭлементы().Добавить();
		НоваяСтрока.Уровень = 1;
		//КонецЕсли;
	Иначе
		Если Элементы.Колонки.ТекущиеДанные.Уровень = 0 Тогда
			КолонкиЭлементы = Элементы.Колонки.ТекущиеДанные.ПолучитьЭлементы();
		Иначе
			КолонкиЭлементы = Элементы.Колонки.ТекущиеДанные.ПолучитьРодителя().ПолучитьЭлементы();
		КонецЕсли;
		
		НоваяСтрока = КолонкиЭлементы.Добавить();
		НоваяСтрока.Уровень = 1;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьВариантОбъектаТаблицы(Команда)
	ТаблицыЭлементы = Таблицы.ПолучитьЭлементы();
	ТаблицыЭлементы.Добавить();
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьТаблицу(Команда)
	Если Элементы.Таблицы.ТекущиеДанные = Неопределено Тогда
		//Если Не Объект.ВестиВариантыОбъектов Тогда
			НоваяСтрока = Таблицы.ПолучитьЭлементы().Добавить();
			НоваяСтрока = НоваяСтрока.ПолучитьЭлементы().Добавить();
			НоваяСтрока.Уровень = 1;
		//КонецЕсли;
	Иначе
		Если Элементы.Таблицы.ТекущиеДанные.Уровень = 0 Тогда
			ТаблицыЭлементы = Элементы.Таблицы.ТекущиеДанные.ПолучитьЭлементы();
		Иначе
			ТаблицыЭлементы = Элементы.Таблицы.ТекущиеДанные.ПолучитьРодителя().ПолучитьЭлементы();
		КонецЕсли;
		
		НоваяСтрока = ТаблицыЭлементы.Добавить();
		НоваяСтрока.Уровень = 1;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьВариантОбъектаРазрезаДанных(Команда)
	НоваяСтрокаРазрезаДанных = РазрезыДанных.ПолучитьЭлементы().Добавить();
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьРазрезДанных(Команда)
	ТекущиеДанные = Элементы.РазрезыДанных.ТекущиеДанные;
	
	Если ТекущиеДанные <> Неопределено Тогда
		Если ТекущиеДанные.ПолучитьРодителя() = Неопределено Тогда
			НоваяСтрокаРазрезыДанных = ТекущиеДанные.ПолучитьЭлементы().Добавить();
			НоваяСтрокаРазрезыДанных.Уровень = 1;
		КонецЕсли;
		
		Элементы.РазрезыДанных.Развернуть(ТекущиеДанные.ПолучитьИдентификатор(), Истина);
	КонецЕсли;
КонецПроцедуры

#КонецОбласти

#Область ВариантыОбъектовЭлементовФормы

&НаКлиенте
Процедура ЦветXMLНажатие(Элемент)
	ДиалогВыбораЦвета = Новый ДиалогВыбораЦвета;
	ДиалогВыбораЦвета.Цвет = Элементы.ЦветXML.ЦветФона;
	Оповещение = Новый ОписаниеОповещения("ВыборЦветаЗавершение", ЭтотОбъект);
	ДиалогВыбораЦвета.Показать(Оповещение);
КонецПроцедуры

&НаКлиенте
Процедура ТипОбъектаПриИзменении(Элемент)
	НастройкаЭлементовФормы();
КонецПроцедуры

&НаКлиенте
Процедура ВестиВариантыОбъектовПриИзменении(Элемент)
	//Элементы.ОснованияДобавитьВариантОбъектаОснования.Видимость = Объект.ВестиВариантыОбъектов;
	Элементы.КолонкиДобавитьВариантОбъектаКолонки.Видимость = Объект.ВестиВариантыОбъектов;
	Элементы.ТаблицыДобавитьВариантОбъектаТаблицы.Видимость = Объект.ВестиВариантыОбъектов;
	//Элементы.РазрезыДанныхДобавитьВариантОбъектаРазрезыДанных.Видимость = Объект.ВестиВариантыОбъектов;
	
	Для Каждого ЭлементПервогоУровня Из Основания.ПолучитьЭлементы() Цикл
		Для Каждого ЭлементВторогоУровня Из ЭлементПервогоУровня.ПолучитьЭлементы() Цикл
			Если ЭлементВторогоУровня.Основание = Объект.Ссылка Тогда
				ЭлементВторогоУровня.ВариантыОбъектовОснованияВедутся = Объект.ВестиВариантыОбъектов;
			КонецЕсли;
		КонецЦикла;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ОснованияОснованиеПриИзменении(Элемент)
	ВариантыОбъектовОснованияВедутся = ?(Элементы.Основания.ТекущиеДанные.Основание.Пустая(), Ложь, ОснованияОснованиеПриИзмененииНаСервере(Элементы.Основания.ТекущиеДанные.Основание));
	Элементы.Основания.ТекущиеДанные.ВариантыОбъектовОснованияВедутся = ВариантыОбъектовОснованияВедутся;
КонецПроцедуры

&НаКлиенте
Процедура РазрезыДанныхРазрезДанныхПриИзменении(Элемент)
	КолонкиРазрезаДанных = ПолучитьКолонкиРазрезаДанных(Элементы.РазрезыДанных.ТекущиеДанные.РазрезДанных);
	ЭлементыКолонкиРазрезаДанных = Элементы.РазрезыДанных.ТекущиеДанные.ПолучитьЭлементы();
	ЭлементыКолонкиРазрезаДанных.Очистить();
	
	Если Не Элементы.РазрезыДанных.ТекущиеДанные.Исключить Тогда
		Для Каждого КолонкаРазрезаДанных Из КолонкиРазрезаДанных Цикл
			НоваяСтрока = ЭлементыКолонкиРазрезаДанных.Добавить();
			НоваяСтрока.Таблица = Элементы.РазрезыДанных.ТекущиеДанные.Таблица;
			НоваяСтрока.КолонкаРазрезаДанных = КолонкаРазрезаДанных;
			НоваяСтрока.Уровень = 2;
		КонецЦикла;
	КонецЕсли;
	
	Элементы.РазрезыДанных.Развернуть(Элементы.РазрезыДанных.ТекущиеДанные.ПолучитьИдентификатор());
КонецПроцедуры

&НаКлиенте
Процедура РазрезыДанныхТаблицаПриИзменении(Элемент)
	Для Каждого РазрезыДанныхЭлемент Из Элементы.РазрезыДанных.ТекущиеДанные.ПолучитьЭлементы() Цикл
		РазрезыДанныхЭлемент.Таблица = Элементы.РазрезыДанных.ТекущиеДанные.Таблица;
	КонецЦикла;
КонецПроцедуры

#КонецОбласти

&НаКлиенте
Процедура НастройкаЭлементовФормы()
	ОбъектСистемыСправочник = Объект.ТипОбъекта = ПредопределенноеЗначение("Справочник.ТипыОбъектов.Справочник");
	ОбъектСистемыДокумент = Объект.ТипОбъекта = ПредопределенноеЗначение("Справочник.ТипыОбъектов.Документ");
	ОбъектСистемыТаблица = Объект.ТипОбъекта = ПредопределенноеЗначение("Справочник.ТипыОбъектов.Таблица");
	ОбъектСистемыПакет = Объект.ТипОбъекта = ПредопределенноеЗначение("Справочник.ТипыОбъектов.Пакет");
	
	Элементы.ВестиВариантыОбъектов.Видимость = Не ОбъектСистемыТаблица;
	Элементы.АлгоритмЗаписи.Видимость = Не ОбъектСистемыТаблица;
	Элементы.ВестиКорректировки.Видимость = Не ОбъектСистемыТаблица;
	Элементы.АлгоритмЗаписиКорректировки.Видимость = Не ОбъектСистемыТаблица;
	Элементы.ВестиВерсии.Видимость = Не ОбъектСистемыТаблица;
	
	Элементы.ГруппаИсточники.Видимость = Не ОбъектСистемыТаблица И Не ОбъектСистемыПакет;
	Элементы.ГруппаОснования.Видимость = Не ОбъектСистемыТаблица И Не ОбъектСистемыПакет;
	Элементы.ГруппаТаблицы.Видимость = Не ОбъектСистемыТаблица;
	Элементы.ГруппаРазрезыДанных.Видимость = Не ОбъектСистемыТаблица;
	
	Элементы.КолонкиВключитьВНаименование.Видимость = ОбъектСистемыСправочник;
	Элементы.КолонкиВыводитьВСписке.Видимость = Не ОбъектСистемыТаблица;
	Элементы.КолонкиВариантОбъекта.Видимость = Не ОбъектСистемыТаблица;
	
	//Элементы.ОснованияДобавитьВариантОбъектаОснования.Видимость = Объект.ВестиВариантыОбъектов;
	Элементы.КолонкиДобавитьВариантОбъектаКолонки.Видимость = Объект.ВестиВариантыОбъектов;
	Элементы.ТаблицыДобавитьВариантОбъектаТаблицы.Видимость = Объект.ВестиВариантыОбъектов;
	//Элементы.РазрезыДанныхДобавитьВариантОбъектаРазрезыДанных.Видимость = Объект.ВестиВариантыОбъектов;
	
	Для Каждого ЭлементИсточники Из Источники.ПолучитьЭлементы() Цикл
		Элементы.Источники.Развернуть(ЭлементИсточники.ПолучитьИдентификатор());
	КонецЦикла;
	
	Для Каждого ЭлементОснования Из Основания.ПолучитьЭлементы() Цикл
		Элементы.Основания.Развернуть(ЭлементОснования.ПолучитьИдентификатор());
	КонецЦикла;
	
	Для Каждого ЭлементКолонки Из Колонки.ПолучитьЭлементы() Цикл
		Элементы.Колонки.Развернуть(ЭлементКолонки.ПолучитьИдентификатор());
	КонецЦикла;
	
	Для Каждого ЭлементТаблицы Из Таблицы.ПолучитьЭлементы() Цикл
		Элементы.Таблицы.Развернуть(ЭлементТаблицы.ПолучитьИдентификатор());
	КонецЦикла;
	
	Для Каждого ЭлементРазрезыДанных Из РазрезыДанных.ПолучитьЭлементы() Цикл
		Элементы.РазрезыДанных.Развернуть(ЭлементРазрезыДанных.ПолучитьИдентификатор(), Истина);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ВыборЦветаЗавершение(Результат, ДополнительныеПараметры) Экспорт
	Если Не Результат = Неопределено Тогда
		Элементы.ЦветXML.ЦветФона = Результат;
		Объект.ЦветXML = СериализаторXDTO.XMLСтрока(Результат);
	КонецЕсли;
КонецПроцедуры

&НаСервереБезКонтекста
Функция ОснованияОснованиеПриИзмененииНаСервере(ОбъектСистемы)
	Возврат ОбъектСистемы.ВестиВариантыОбъектов;
КонецФункции

&НаСервереБезКонтекста
Функция ПолучитьКолонкиРазрезаДанных(РазрезДанных)
	Возврат РазрезДанных.КолонокиРазрезаДанных.ВыгрузитьКолонку("КолонкаРазрезаДанных");
КонецФункции

&НаКлиенте
Процедура ТаблицыСохранятьВводПриИзменении(Элемент)
	Если Не Элемент.Родитель.ТекущиеДанные.Сохранять Тогда
		Элемент.Родитель.ТекущиеДанные.Ввод = Ложь;
	КонецЕсли;
КонецПроцедуры

//&НаКлиенте
//Процедура ТестУдалить(Команда)
//	ПараметрыФормы = Новый Структура;
//	ПараметрыФормы.Вставить("Ключ", Объект.Ссылка);
//	ПараметрыФормы.Вставить("НомерВерсииПереходаНаВерсиюИсторииДанных", 26);
//	ОткрытьФорму("Справочник.ОбъектыСистемы.Форма.ФормаЭлемента", ПараметрыФормы);
//КонецПроцедуры








﻿
&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	ГУИД = XMLСтрока(ТекущийОбъект.Ссылка);
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	РаботаСФормойНаСервере.ЗаполнитьФорму(ЭтотОбъект);
	РаботаСФормойНаСервере.НастроитьФорму(ЭтотОбъект, Объект);
КонецПроцедуры

&НаСервере
Процедура ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи)
	РаботаСФормойНаСервере.ПередЗаписьюНаСервере(Отказ, ТекущийОбъект, ПараметрыЗаписи, ЭтотОбъект);
КонецПроцедуры

&НаКлиенте
Процедура СоздатьНаОсновании(Команда)
	ЗначенияЗаполнения = Неопределено;
	
	Если Команда.Имя = "СоздатьВерсию" Тогда
		ЗначенияЗаполнения = Новый Структура(
		"Команда,			ОбъектСистемы,			ВариантОбъекта,		Наименование,			Основание,			Корректировка,			Версия",
		"СоздатьВерсию",	Объект.ОбъектСистемы,	Объект.ВариантОбъекта,	Объект.Наименование,	Объект.Основание,	Объект.Корректировка,	?(Объект.Версия.Пустая(), Объект.Ссылка, Объект.Версия));
		ПараметрыФормы = Новый Структура("ЗначенияЗаполнения", ЗначенияЗаполнения);
		ОткрытьФорму("Документ.ЭлементыОбъектовСистемы.ФормаОбъекта", ПараметрыФормы);
	ИначеЕсли Команда.Имя = "СоздатьКорректировку" Тогда
		ЗначенияЗаполнения = Новый Структура(
		"Команда,				ОбъектСистемы,			ВариантОбъекта,		Наименование,			Основание,			Корректировка,															Версия",
		"СоздатьКорректировку",	Объект.ОбъектСистемы,	Объект.ВариантОбъекта,	Объект.Наименование,	Объект.Основание,	?(Объект.Корректировка.Пустая(), Объект.Ссылка, Объект.Корректировка),	Объект.Версия);
		ПараметрыФормы = Новый Структура("ЗначенияЗаполнения", ЗначенияЗаполнения);
		ОткрытьФорму("Документ.ЭлементыОбъектовСистемы.ФормаОбъекта", ПараметрыФормы);
	Иначе
		Если КомандыКнопок.Свойство(Команда.Имя, ЗначенияЗаполнения) Тогда
			ЗначенияЗаполнения = Новый Структура(
			"Команда,				ОбъектСистемы,						ВариантОбъекта,					Наименование,			Основание",
			"СоздатьНаОсновании",	ЗначенияЗаполнения.ОбъектСистемы,	ЗначенияЗаполнения.ВариантОбъекта,	Объект.Наименование,	Объект.Ссылка);
			ПараметрыФормы = Новый Структура("ЗначенияЗаполнения", ЗначенияЗаполнения);
			ОткрытьФорму("Документ.ЭлементыОбъектовСистемы.ФормаОбъекта", ПараметрыФормы);
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры

&НаКлиенте
Процедура ОбъектСистемыПриИзменении(Элемент)
	ОбъектСистемыВариантОбъектаПриИзмененииНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ВариантОбъектаПриИзменении(Элемент)
	ОбъектСистемыВариантОбъектаПриИзмененииНаСервере();
КонецПроцедуры

&НаСервере
Процедура ОбъектСистемыВариантОбъектаПриИзмененииНаСервере()
	РаботаСФормойНаСервере.ОчиститьФорму(ЭтотОбъект);
	РаботаСФормойНаСервере.ЗаполнитьФорму(ЭтотОбъект);
	РаботаСФормойНаСервере.НастроитьФорму(ЭтотОбъект, Объект);
КонецПроцедуры




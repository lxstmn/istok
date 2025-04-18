﻿
Функция НоваяДекорация(ГрафСхемаXDTO, Имя, Заголовок, Фигура, Лево, Верх, Ширина, Высота) Экспорт
	НоваяДекорация = СериализаторXDTO.Фабрика.Создать(СериализаторXDTO.Фабрика.Тип("http://v8.1c.ru/8.2/data/graphscheme", "GraphSchemeItem"));
	
	НоваяДекорация.alignHor = ГоризонтальноеПоложение.Центр;
	НоваяДекорация.alignVer = ВертикальноеПоложение.Центр;
	НоваяДекорация.angle = 0;
	НоваяДекорация.backColor = Новый Цвет;
	НоваяДекорация.border = СериализаторXDTO.ЗаписатьXDTO(Новый Линия(ТипСоединительнойЛинии.Сплошная, 1));
	НоваяДекорация.currentLanguage = "#";
	НоваяДекорация.groupNum = 0;
	НоваяДекорация.hyperlink = Ложь;
	НоваяДекорация.itemCode = Имя;
	НоваяДекорация.itemId = ГрафСхемаXDTO.item.Количество() + 1;
	НоваяДекорация.itemTabOrder = НоваяДекорация.itemId;
	
	ЗаголовокЭлемента = СериализаторXDTO.Фабрика.Создать(СериализаторXDTO.Фабрика.Тип("http://v8.1c.ru/8.1/data/core", "LocalStringItemType"));
	ЗаголовокЭлемента.content = Заголовок;
	ЗаголовокЭлемента.lang = "#";
		
	Заголовки = СериализаторXDTO.Фабрика.Создать(СериализаторXDTO.Фабрика.Тип("http://v8.1c.ru/8.1/data/core", "LocalStringType"));
	Заголовки.item.Добавить(ЗаголовокЭлемента);
	
	НоваяДекорация.itemTitle = Заголовки;
	НоваяДекорация.itemType = 0;
	НоваяДекорация.lineColor = Новый Цвет;
	НоваяДекорация.passageState = 0;
	НоваяДекорация.picturePlacement = ПоложениеКартинкиЭлементаГрафическойСхемы.Лево;
	НоваяДекорация.pictureStyle = 4;
	НоваяДекорация.pointUUID = Новый УникальныйИдентификатор;
	НоваяДекорация.rectBottom = Верх + Высота;
	НоваяДекорация.rectLeft = Лево;
	НоваяДекорация.rectRight = Лево + Ширина;
	НоваяДекорация.rectTop = Верх;
	НоваяДекорация.shape = Фигура;
	НоваяДекорация.tableCode = 0;
	НоваяДекорация.textColor = Новый Цвет;
	НоваяДекорация.transparent = Ложь;
	
	Возврат НоваяДекорация;
КонецФункции

Функция НоваяДекоративнаяЛиния(ГрафСхемаXDTO, Имя, Координаты) Экспорт
	НоваяДекоративнаяЛиния = СериализаторXDTO.Фабрика.Создать(СериализаторXDTO.Фабрика.Тип("http://v8.1c.ru/8.2/data/graphscheme", "GraphSchemeItem"));
	
	НоваяДекоративнаяЛиния.alignHor = ГоризонтальноеПоложение.Центр;
	НоваяДекоративнаяЛиния.alignVer = ВертикальноеПоложение.Центр;
	НоваяДекоративнаяЛиния.backColor = Новый Цвет;
	НоваяДекоративнаяЛиния.beginArrowStyle = СтильСтрелки.Нет;
	НоваяДекоративнаяЛиния.border = СериализаторXDTO.ЗаписатьXDTO(Новый Линия(ТипСоединительнойЛинии.Сплошная, 1));
	НоваяДекоративнаяЛиния.connectFromItemId = -1;
	НоваяДекоративнаяЛиния.connectFromPortIndex = 0;
	НоваяДекоративнаяЛиния.connectToItemId = -1;
	НоваяДекоративнаяЛиния.currentLanguage = "#";
	НоваяДекоративнаяЛиния.decorativeLine = Истина;
	НоваяДекоративнаяЛиния.endArrowStyle = СтильСтрелки.Нет;
	НоваяДекоративнаяЛиния.groupNum = 0;
	НоваяДекоративнаяЛиния.hyperlink = Ложь;
	НоваяДекоративнаяЛиния.itemCode = Имя;
	НоваяДекоративнаяЛиния.itemId = ГрафСхемаXDTO.item.Количество() + 1;
	НоваяДекоративнаяЛиния.itemTabOrder = НоваяДекоративнаяЛиния.itemId;
	НоваяДекоративнаяЛиния.itemType = 1;
	НоваяДекоративнаяЛиния.lineColor = Новый Цвет;
	
	Для Счетчик = 0 По Координаты.Количество() / 2 - 1 Цикл
		ТочкаXDTO = СериализаторXDTO.Фабрика.Создать(СериализаторXDTO.Фабрика.Тип("http://v8.1c.ru/8.2/data/graphscheme", "Point"));
		ТочкаXDTO.x = Число(Координаты[Счетчик * 2]);
		ТочкаXDTO.y = Число(Координаты[Счетчик * 2 + 1]);
		
		НоваяДекоративнаяЛиния.Point.Добавить(ТочкаXDTO);
	КонецЦикла;
	
	НоваяДекоративнаяЛиния.pointUUID = Новый УникальныйИдентификатор;
	НоваяДекоративнаяЛиния.portIndexFrom = 0;
	НоваяДекоративнаяЛиния.portIndexTo = 0;
	НоваяДекоративнаяЛиния.tableCode = 0;
	НоваяДекоративнаяЛиния.textColor = Новый Цвет;
	НоваяДекоративнаяЛиния.transparent = Ложь;
	
	Возврат НоваяДекоративнаяЛиния;
КонецФункции











﻿#Использовать logos

Перем Лог;
Перем мПараметры;
Перем мПозиционныеПараметры;

Перем мКоманды;

Перем мПозицияВСпискеТокенов;
Перем мПозицияПозиционныхПараметров;
Перем мМассивВходныхПараметров;

Функция ДобавитьПараметр(Знач ИмяПараметра, Знач Пояснение = "") Экспорт
	
	Лог.Отладка("ДобавитьПараметр: ИмяПараметра <"+ИмяПараметра+">");		
	
	ДобавитьПараметрВТаблицу(мПозиционныеПараметры, ИмяПараметра, Пояснение, Ложь, Ложь);
	
КонецФункции

Функция ДобавитьИменованныйПараметр(Знач ИмяПараметра, Знач Пояснение = "", Знач Глобальный = Ложь) Экспорт
	
	Лог.Отладка("ДобавитьИменованныйПараметр: ИмяПараметра <"+ИмяПараметра+">");		
	
	ДобавитьПараметрВТаблицу(мПараметры, ИмяПараметра, Пояснение, Ложь, Глобальный);
	
КонецФункции

Функция ДобавитьПараметрФлаг(Знач ИмяПараметра, Знач Пояснение = "", Знач Глобальный = Ложь) Экспорт
	
	Лог.Отладка("ДобавитьПараметрФлаг: ИмяПараметра <"+ИмяПараметра+">");		
	
	ДобавитьПараметрВТаблицу(мПараметры, ИмяПараметра, Пояснение, Истина, Глобальный);
	
КонецФункции

Функция ДобавитьПараметрКоллекция(Знач ИмяПараметра, Знач Пояснение = "") Экспорт
	
	Лог.Отладка("ДобавитьПараметрКоллекция: ИмяПараметра <"+ИмяПараметра+">");		
	
	ДобавитьПараметрКоллекцияВТаблицу(мПозиционныеПараметры, ИмяПараметра, Пояснение);
	
КонецФункции

Функция ОписаниеКоманды(Знач ИмяКоманды, Знач Пояснение = "") Экспорт
	
	НовоеОписание = Новый Структура;
	НовоеОписание.Вставить("Команда", ИмяКоманды);
	НовоеОписание.Вставить("Пояснение", Пояснение);
	НовоеОписание.Вставить("ПозиционныеПараметры", НоваяТаблицаПараметров());
	НовоеОписание.Вставить("ИменованныеПараметры", НоваяТаблицаПараметров());
	
	Возврат НовоеОписание;
	
КонецФункции

Процедура ДобавитьКоманду(Знач ОписаниеКоманды) Экспорт
	
	мКоманды.Вставить(ОписаниеКоманды.Команда, ОписаниеКоманды);
	
КонецПроцедуры

Функция ДобавитьПозиционныйПараметрКоманды(Знач ОписаниеКоманды, Знач ИмяПараметра, Знач Пояснение = "") Экспорт
	Лог.Отладка("Добавляю позиционный параметр "+ИмяПараметра);
	Возврат ДобавитьПараметрВТаблицу(ОписаниеКоманды.ПозиционныеПараметры, ИмяПараметра, Пояснение, Ложь);
КонецФункции

Функция ДобавитьИменованныйПараметрКоманды(Знач ОписаниеКоманды, Знач ИмяПараметра, Знач Пояснение = "") Экспорт
	Лог.Отладка("Добавляю именованный параметр "+ИмяПараметра);
	Возврат ДобавитьПараметрВТаблицу(ОписаниеКоманды.ИменованныеПараметры, ИмяПараметра, Пояснение, Ложь);
КонецФункции

Функция ДобавитьПараметрФлагКоманды(Знач ОписаниеКоманды, Знач ИмяПараметра, Знач Пояснение = "") Экспорт
	Лог.Отладка("Добавляю параметр-флаг "+ИмяПараметра);
	Возврат ДобавитьПараметрВТаблицу(ОписаниеКоманды.ИменованныеПараметры, ИмяПараметра, Пояснение, Истина);
КонецФункции

Функция ДобавитьПараметрКоллекцияКоманды(Знач ОписаниеКоманды, Знач ИмяПараметра, Знач Пояснение = "") Экспорт
	Лог.Отладка("Добавляю параметр-коллекция "+ИмяПараметра);
	Возврат ДобавитьПараметрКоллекцияВТаблицу(ОписаниеКоманды.ПозиционныеПараметры, ИмяПараметра, Пояснение);
КонецФункции

Функция ДобавитьИменованныйПараметрКоллекцияКоманды(Знач ОписаниеКоманды, Знач ИмяПараметра, Знач Пояснение = "") Экспорт
	Лог.Отладка("Добавляю параметр-коллекция "+ИмяПараметра);
	Возврат ДобавитьПараметрКоллекцияВТаблицу(ОписаниеКоманды.ИменованныеПараметры, ИмяПараметра, Пояснение);
КонецФункции

Функция РазобратьКоманду(Знач МассивПараметров) Экспорт
	
	Если МассивПараметров.Количество() = 0 Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	ОписаниеКоманды = мКоманды[МассивПараметров[0]];
	Если ОписаниеКоманды = Неопределено Тогда
		ВызватьИсключение "Неизвестная команда: " + МассивПараметров[0];
	КонецЕсли;
	Лог.Отладка("Разбор команды: " + ОписаниеКоманды.Команда);
	
	ГлобальныеПараметры = мПараметры.НайтиСтроки(Новый Структура("ЭтоГлобальныйПараметр", Истина));
	Для Каждого СтрГлобальныйПараметр Из ГлобальныеПараметры Цикл
		СтрСуществующий = ОписаниеКоманды.ИменованныеПараметры.Найти(СтрГлобальныйПараметр.Имя,"Имя");
		Если СтрСуществующий = Неопределено Тогда
			Лог.Отладка("Добавляю глобальный параметр: " + СтрГлобальныйПараметр.Имя);
			ЗаполнитьЗначенияСвойств(ОписаниеКоманды.ИменованныеПараметры.Добавить(), СтрГлобальныйПараметр,, "ЭтоГлобальныйПараметр");
		КонецЕсли;
	КонецЦикла;
	
	РезультатКоманды = Новый Структура;
	РезультатКоманды.Вставить("Команда", ОписаниеКоманды.Команда);
	РезультатКоманды.Вставить("ЗначенияПараметров", Новый Соответствие);
	
	мМассивВходныхПараметров = МассивПараметров;
	мПозицияВСпискеТокенов = 1;
	мПозицияПозиционныхПараметров = 0;
	
	РезультатКоманды.ЗначенияПараметров = РазобратьАргументы(ОписаниеКоманды.ИменованныеПараметры, ОписаниеКоманды.ПозиционныеПараметры);
	
	Лог.Отладка("Трассировка РезультатКоманды.ЗначенияПараметров:");
	ВывестиРезультатРазбора(РезультатКоманды.ЗначенияПараметров);
	
	Возврат РезультатКоманды;
	
КонецФункции

Функция Разобрать(Знач ВходнойМассивПараметров) Экспорт
	
	Если Лог.Уровень() = УровниЛога.Отладка Тогда
		Лог.Отладка("ВходнойМассивПараметров <%1>", СтрокаПараметров(ВходнойМассивПараметров));
	КонецЕсли;
	
	ОписаниеКоманды = Неопределено;
	Если ВходнойМассивПараметров.Количество() > 0 Тогда 
		ОписаниеКоманды = мКоманды[ВходнойМассивПараметров[0]];
	КонецЕсли;
	Если ОписаниеКоманды <> Неопределено Тогда
		Лог.Отладка("Первый параметр совпадает с именем команды. Переход в режим обработки команд");
		Возврат РазобратьКоманду(ВходнойМассивПараметров);
	Иначе
		мМассивВходныхПараметров = Новый Массив;
		Для Каждого Элемент Из ВходнойМассивПараметров Цикл
			мМассивВходныхПараметров.Добавить(Элемент);
		КонецЦикла;
		
		мПозицияПозиционныхПараметров = 0;
		мПозицияВСпискеТокенов        = 0;
		
		РезультатРазбора = РазобратьАргументы(мПараметры, мПозиционныеПараметры);
		
		Лог.Отладка("Трассировка РезультатКоманды.ЗначенияПараметров:");
		ВывестиРезультатРазбора(РезультатРазбора);
		
		Возврат РезультатРазбора;
	КонецЕсли;
	
КонецФункции

Функция СтрокаПараметров(Знач ВходнойМассивПараметров)
	Строка = "";
	Для Каждого Параметр Из ВходнойМассивПараметров Цикл
		Строка = Строка + Параметр + " ";
	КонецЦикла;
	Возврат Строка;
КонецФункции // СтрокаПараметров()

Функция СправкаПоПараметрам() Экспорт
	Возврат ТаблицаСправкаПоПараметрам(мПараметры, мПозиционныеПараметры, Ложь);
КонецФункции

Процедура ВывестиСправкуПоПараметрам() Экспорт
	Сообщить("Параметры:");
	Для Каждого СтрПараметр Из СправкаПоПараметрам() Цикл
		Если Не СтрПараметр.ЭтоИменованныйПараметр Тогда
			Сообщить(СтрШаблон(" <%1> - %2", СтрПараметр.Имя, СтрПараметр.Пояснение));
		Иначе
			Сообщить(СтрШаблон(" %1 - %2", СтрПараметр.Имя, СтрПараметр.Пояснение));
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

Функция СправкаПоКоманде(Знач ИмяКоманды) Экспорт
	
	ТаблицаСправкаПоКомандам = СправкаВозможныеКоманды();
	Возврат ТаблицаСправкаПоКомандам.Найти(ИмяКоманды, "Команда");
	
КонецФункции

Функция СправкаВозможныеКоманды() Экспорт
	
	ТаблицаСправка = Новый ТаблицаЗначений;
	ТаблицаСправка.Колонки.Добавить("Команда");
	ТаблицаСправка.Колонки.Добавить("Пояснение");
	ТаблицаСправка.Колонки.Добавить("Параметры");
	
	Для Каждого КлючИЗначение Из мКоманды Цикл
		СтрСправка      = ТаблицаСправка.Добавить();
		ОписаниеКоманды = КлючИЗначение.Значение;
		
		СтрСправка.Команда   = ОписаниеКоманды.Команда;
		СтрСправка.Пояснение = ОписаниеКоманды.Пояснение;
		СправкаПоПараметрам  = ТаблицаСправкаПоПараметрам(ОписаниеКоманды.ИменованныеПараметры,
			ОписаниеКоманды.ПозиционныеПараметры, Истина);
		СтрСправка.Параметры = СправкаПоПараметрам;
		
	КонецЦикла;
	
	Возврат ТаблицаСправка;
	
КонецФункции

Процедура ВывестиСправкуПоКомандам() Экспорт
	
	Сообщить("Возможные команды:");

	ВозможныеКоманды = СправкаВозможныеКоманды();
	
	МаксШирина = 0;
	Поле = "               ";
	Для Каждого Команда Из ВозможныеКоманды Цикл
		ТекШирина = СтрДлина(Команда.Команда);
		Если ТекШирина > МаксШирина Тогда
			МаксШирина = ТекШирина;
		КонецЕсли;
	КонецЦикла;

	Для Каждого Команда Из ВозможныеКоманды Цикл
		Сообщить(" " + Лев(Команда.Команда + Поле, МаксШирина + 2) + "- " + Команда.Пояснение);
	КонецЦикла;
	
КонецПроцедуры

Процедура ВывестиСправкуПоКоманде(Знач ИмяКоманды) Экспорт

	ВозможныеКоманды = СправкаВозможныеКоманды();
	ОписаниеКоманды = ВозможныеКоманды.Найти(ИмяКоманды, "Команда");
	Если ОписаниеКоманды = Неопределено Тогда
		Сообщить("Команда отсуствует: " + ИмяКоманды);
		Возврат;
	КонецЕсли;

	Сообщить("" + ОписаниеКоманды.Команда + " - " + ОписаниеКоманды.Пояснение);
	Сообщить("Параметры:");
	Для Каждого СтрПараметр Из ОписаниеКоманды.Параметры Цикл
		Если Не СтрПараметр.ЭтоИменованныйПараметр Тогда
			Сообщить(СтрШаблон(" <%1> - %2", СтрПараметр.Имя, СтрПараметр.Пояснение));
		Иначе
			Сообщить(СтрШаблон(" %1 - %2", СтрПараметр.Имя, СтрПараметр.Пояснение));
		КонецЕсли;
	КонецЦикла;

КонецПроцедуры

Функция ТаблицаСправкаПоПараметрам(Знач ИменованныеПараметры, Знач ПозиционныеПараметры, Знач ДобавлятьГлобальныеПараметры)
	
	ТабРезультат = НоваяТаблицаПараметров();
	ТабРезультат.Колонки.Добавить("ЭтоИменованныйПараметр");
	
	Для Каждого Стр Из ПозиционныеПараметры.НайтиСтроки(Новый Структура("ЭтоКоллекция", Ложь)) Цикл
		СтрРезультат = ТабРезультат.Добавить();
		ЗаполнитьЗначенияСвойств(СтрРезультат, Стр);
		СтрРезультат.ЭтоИменованныйПараметр = Ложь;
	КонецЦикла;
	
	Для Каждого Стр Из ИменованныеПараметры Цикл
		СтрРезультат = ТабРезультат.Добавить();
		ЗаполнитьЗначенияСвойств(СтрРезультат, Стр);
		СтрРезультат.ЭтоИменованныйПараметр = Истина;
	КонецЦикла;

	Если ДобавлятьГлобальныеПараметры Тогда
		
		ГлобальныеПараметры = мПараметры.НайтиСтроки(Новый Структура("ЭтоГлобальныйПараметр", Истина));
		Для Каждого СтрГлобальныйПараметр Из ГлобальныеПараметры Цикл
			СтрСуществующий = ИменованныеПараметры.Найти(СтрГлобальныйПараметр.Имя,"Имя");
			Если СтрСуществующий = Неопределено Тогда
				СтрРезультат = ТабРезультат.Добавить();
				ЗаполнитьЗначенияСвойств(СтрРезультат, СтрГлобальныйПараметр,, "ЭтоГлобальныйПараметр");
				СтрРезультат.ЭтоИменованныйПараметр = Истина;
			КонецЕсли;
		КонецЦикла;

	КонецЕсли;

	Для Каждого Стр Из ПозиционныеПараметры.НайтиСтроки(Новый Структура("ЭтоКоллекция", Истина)) Цикл
		СтрРезультат = ТабРезультат.Добавить();
		ЗаполнитьЗначенияСвойств(СтрРезультат, Стр);
		СтрРезультат.ЭтоИменованныйПараметр = Ложь;
	КонецЦикла;
	
	Возврат ТабРезультат;
	
КонецФункции

Процедура РазобратьИменованныйПараметр(Знач Токен, Значение = Неопределено, Знач ИменованныеПараметры, Знач РезультатРазбора)
	Перем ЗначениеТокена;

	Лог.Отладка("Это именованный параметр: " + Токен + " ?");
	СтрПараметр = ИменованныеПараметры.Найти(Токен, "Имя");
	//TODO: для параметров вида --param=value значение получаем сразу и передаем в процедуру,
	// а в случаи пустого получаем следующий параметр.
	ЗначениеТокена = ?(Значение = Неопределено, СледующийОбязательныйТокен(Токен), Значение);
	Если СтрПараметр.ЭтоКоллекция Тогда
		Лог.Отладка("Добавляем элемент в коллекцию");
		ТекКолекция = РезультатРазбора[Токен];
		Если ТекКолекция = Неопределено Тогда
			ТекКолекция = Новый Массив;
			РезультатРазбора[Токен] = ТекКолекция;
		КонецЕсли;
		ТекКолекция.Добавить(ЗначениеТокена);
	Иначе
		РезультатРазбора[Токен] = ЗначениеТокена;
	КонецЕсли;
	Лог.Отладка("Нашли значение именованного параметра: " + РезультатРазбора[Токен]);

КонецПроцедуры

Функция РазобратьАргументы(Знач ИменованныеПараметры, Знач ПозиционныеПараметры)
	Лог.Отладка("Попадаю в РазобратьАргументы");
	
	РезультатРазбора = Новый Соответствие;

	Если мМассивВходныхПараметров.Количество() = 0 Тогда 
		Лог.Отладка("Параметров не передали.");
		Возврат РезультатРазбора;
	КонецЕсли;
	
	Для Каждого СтрПараметр Из ИменованныеПараметры.НайтиСтроки(Новый Структура("ЭтоФлаг",Истина)) Цикл
		Лог.Отладка("Сбрасываю параметр-флаг: " + СтрПараметр.Имя);
		РезультатРазбора[СтрПараметр.Имя] = Ложь;
	КонецЦикла;

	ТекущийПараметрКоллекция = Неопределено;
	Пока Истина Цикл
		
		Токен = СледующийТокен();
		Лог.Отладка("Выбран токен: " + Токен);
		Если Токен = Неопределено Тогда
			Лог.Отладка("Закончились токены");
			
			Лог.Отладка("Трассировка РезультатРазбора:");
			ВывестиРезультатРазбора(РезультатРазбора);
			
			Прервать;
		КонецЕсли;
		
		Если ТекущийПараметрКоллекция <> Неопределено Тогда
			ТекущийПараметрКоллекция.Добавить(Токен);
			Продолжить;
		КонецЕсли;
		
		Если ЭтоИменованныйПараметр(Токен, ИменованныеПараметры) Тогда
			РазобратьИменованныйПараметр(Токен, Неопределено, ИменованныеПараметры, РезультатРазбора);
		ИначеЕсли ЭтоПараметрФлаг(Токен, ИменованныеПараметры) Тогда
			Лог.Отладка("Это параметр-флаг: " + Токен + " ?");
			РезультатРазбора[Токен] = Истина;
			Лог.Отладка("Нашли параметр-флаг: " + РезультатРазбора[Токен]);
		ИначеЕсли СтрНайти(Токен, "=") > 0 И Лев(Токен, 2) = "--" Тогда
			Индекс = СтрНайти(Токен, "=");
			КлючТокена = Лев(Токен, Индекс-1);
			ЗначениеТокена = Строка(Сред(Токен, Индекс + 1)); //Для указания пустого значения, можно --param= 
			Если ЭтоИменованныйПараметр(СокрЛП(КлючТокена), ИменованныеПараметры) Тогда
				РазобратьИменованныйПараметр(КлючТокена, ЗначениеТокена, ИменованныеПараметры, РезультатРазбора);
			Иначе
				ВызватьИсключение "Ожидается именованный параметр " + КлючТокена;
			КонецЕсли;
		Иначе
			ОписаниеПараметра = СледующийПозиционныйПараметр(ПозиционныеПараметры);
			Если ОписаниеПараметра.ЭтоКоллекция Тогда
				Лог.Отладка("Перехожу к чтению параметра-коллекции <"+ОписаниеПараметра.Имя+">");
				ТекущийПараметрКоллекция = Новый Массив;
				РезультатРазбора[ОписаниеПараметра.Имя] = ТекущийПараметрКоллекция;
				ТекущийПараметрКоллекция.Добавить(Токен);
			Иначе
				Лог.Отладка("Установлено значение позиционного параметра <" + ОписаниеПараметра.Имя + " = " + Токен + ">");
				РезультатРазбора[ОписаниеПараметра.Имя] = Токен;
			КонецЕсли;
		КонецЕсли;
		
	КонецЦикла;
	
	Возврат РезультатРазбора;
	
КонецФункции

Процедура ВывестиРезультатРазбора(РезультатРазбора)
	Если Лог.Уровень() = УровниЛога.Отладка Тогда
		Для Каждого КлючЗначение Из РезультатРазбора Цикл
			Лог.Отладка("		"+КлючЗначение.Ключ+":"+КлючЗначение.Значение);
		КонецЦикла;
	КонецЕсли;
КонецПроцедуры

Функция СледующийТокен()
	Если мПозицияВСпискеТокенов = мМассивВходныхПараметров.Количество() Тогда
		Возврат Неопределено;
	КонецЕсли;
	
	Токен = мМассивВходныхПараметров[мПозицияВСпискеТокенов];
	мПозицияВСпискеТокенов = мПозицияВСпискеТокенов + 1;
	
	Возврат Токен;
КонецФункции

Функция СледующийОбязательныйТокен(Знач ИскомыйПараметр)
	Токен = СледующийТокен();
	Если Токен = Неопределено Тогда
		ВызватьИсключение "Ожидается значение параметра " + ИскомыйПараметр;
	КонецЕсли;
	Возврат Токен;
КонецФункции

Функция ЭтоИменованныйПараметр(Знач Токен, Знач ИменованныеПараметры)
	Лог.Отладка("Ищу именованный параметр "+Токен);
	СтрПараметр = ИменованныеПараметры.Найти(Токен, "Имя");
	Возврат СтрПараметр <> Неопределено и Не СтрПараметр.ЭтоФлаг;
КонецФункции

Функция ЭтоПараметрФлаг(Знач Токен, Знач ИменованныеПараметры)
	Лог.Отладка("Ищу параметр-флаг "+Токен);
	СтрПараметр = ИменованныеПараметры.Найти(Токен, "Имя");
	Возврат СтрПараметр <> Неопределено и СтрПараметр.ЭтоФлаг;
КонецФункции

Функция ЗакончилисьПозиционныеПараметры(ПозиционныеПараметры)
	Возврат мПозицияПозиционныхПараметров = ПозиционныеПараметры.Количество();
КонецФункции

Функция СледующийПозиционныйПараметр(Знач ПозиционныеПараметры)
	Если мПозицияПозиционныхПараметров = ПозиционныеПараметры.Количество() Тогда
		ВызватьИсключение СтрШаблон("Неизвестный параметр в позиции %1 параметр %2 %3%4", мПозицияВСпискеТокенов, мМассивВходныхПараметров.Получить(мПозицияВСпискеТокенов - 1), Символы.ПС, СтрокаПараметров(мМассивВходныхПараметров));
	КонецЕсли;
	
	СтрПараметр = ПозиционныеПараметры[мПозицияПозиционныхПараметров];
	мПозицияПозиционныхПараметров = мПозицияПозиционныхПараметров + 1;
	Возврат СтрПараметр;
КонецФункции

Процедура Инит()
	Лог = Логирование.ПолучитьЛог("oscript.lib.cmdline");
	
	мПараметры = НоваяТаблицаПараметров();
	мПозиционныеПараметры = НоваяТаблицаПараметров();
	мКоманды   = Новый Соответствие;
КонецПроцедуры

Функция НоваяТаблицаПараметров()
	
	Таблица = Новый ТаблицаЗначений;
	Таблица.Колонки.Добавить("Имя");
	Таблица.Колонки.Добавить("ЭтоФлаг");
	Таблица.Колонки.Добавить("Пояснение");
	Таблица.Колонки.Добавить("ЭтоГлобальныйПараметр");
	Таблица.Колонки.Добавить("ЭтоКоллекция");
	
	Возврат Таблица;
	
КонецФункции

Функция ДобавитьПараметрВТаблицу(Знач Таблица, Знач Имя, Знач Пояснение, Знач Флаг, Знач Глобальный = Ложь)
	СтрПараметр = Таблица.Добавить();
	СтрПараметр.Имя       = Строка(Имя);
	СтрПараметр.ЭтоФлаг   = Флаг;
	СтрПараметр.Пояснение = Пояснение;
	СтрПараметр.ЭтоГлобальныйПараметр = Глобальный;
	СтрПараметр.ЭтоКоллекция = Ложь;

	Возврат СтрПараметр;
	
КонецФункции

Функция ДобавитьПараметрКоллекцияВТаблицу(Знач Таблица, Знач Имя, Знач Пояснение)

	СтрПараметр = ДобавитьПараметрВТаблицу(Таблица, Имя, Пояснение, Ложь);
	СтрПараметр.ЭтоКоллекция = Истина;

КонецФункции

Инит();

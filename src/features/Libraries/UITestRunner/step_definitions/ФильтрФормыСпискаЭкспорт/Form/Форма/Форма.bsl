﻿
///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,ОписаниеШага,ТипШага,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке(ТабПарам)","ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке","И для каждой строки таблицы отбора я устанавливаю отбор в списке","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И для каждой строки таблицы отбора я устанавливаю отбор в списке
//@ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке(ТабПарам)
Процедура ДляКаждойСтрокиТаблицыОтбораЯУстанавливаюОтборВСписке(ТабПарам) Экспорт
	
	Для Каждого СтрокаФильтра Из ТабПарам Цикл
		Ванесса.Шаг("И     В форме ""Настройка списка"" в таблице ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица"" я перехожу к строке:
		| | 'Доступные поля' |
		| | '" + СтрокаФильтра.Кол1 + "' |
		|");
		
		Ванесса.Шаг("И В форме ""Настройка списка"" в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ДоступныеПоляТаблица"" я выбираю текущую строку");
		Ванесса.Шаг("И я перехожу к закладке ""Отбор""");
		
		ТЧ = Ванесса.НайтиТЧПоИмени("КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор");
		ВидСравненияТекст = ТЧ.ПолучитьТекстЯчейки("КомпоновщикНастроекПользовательскиеНастройкиЭлемент0ОтборВидСравнения");
		
		Ванесса.Шаг("И в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я активизирую поле ""Значение""");
		Ванесса.Шаг("И В форме ""Настройка списка"" в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я выбираю текущую строку");
		Ванесса.Шаг("И в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" в поле ""Значение"" я ввожу текст '" + СтрокаФильтра.Кол3 + "'");
		
		
		
		//Ванесса.Шаг("И в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я активизирую поле ""Вид сравнения""");
		//Сообщить("ТЧ.ПолучитьТекущийЭлемент().Имя=" + ТЧ.ПолучитьТекущийЭлемент().Имя);
		
		//Сообщить("ВидСравненияТекст=" + ВидСравненияТекст);
		
		Если НРег(СокрЛП(ВидСравненияТекст)) <> НРег(СокрЛП(СтрокаФильтра.Кол2)) Тогда
			//Сообщить("ВидСравненияТекст=" + ВидСравненияТекст);
			//Сообщить("СтрокаФильтра.Кол2=" + СтрокаФильтра.Кол2);
			Ванесса.Шаг("И в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я активизирую поле ""Вид сравнения""");
			Ванесса.Шаг("И в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" в поле ""Вид сравнения"" я ввожу текст '" + СтрокаФильтра.Кол2 + "'");
		КонецЕсли;	 
		
		
		//Ванесса.Шаг("И     В форме ""Настройка списка"" в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я завершаю редактирование строки");
		
		//Ванесса.Шаг("И В форме ""Настройка списка"" в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я выбираю текущую строку");
		
		Ванесса.Шаг("И В форме ""Настройка списка"" в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я завершаю редактирование строки");
		
		
		
		
		
		Ванесса.Шаг("И     В форме ""Настройка списка"" в ТЧ ""КомпоновщикНастроекПользовательскиеНастройкиЭлемент0Отбор"" я завершаю редактирование строки");
	КонецЦикла;	
КонецПроцедуры

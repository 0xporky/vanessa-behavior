﻿# encoding: utf-8
# language: ru

@IgnoreOnCIMainBuild
@DocumentationBuild
@tree

Функционал: Инструкция по генерации EPF файла
	Как Разработчик
	Я Хочу чтобы я мог создавать по feature файлам EPF файлы
	Чтобы я мог потом в этих EPF файлах реализовать нужные мне шаги
 
Контекст:
	Дано Я убедился что служебный EPF для проверки генерации EPF удален
	Дано Я открываю Vanessa-Behavoir в TestClient без загрузки сохраненных настроек

	
Сценарий: Создание нового EPF по feature файлу
	Когда Я нажимаю на кнопку Загрузить одну фичу
	Тогда в открывшемся окне я указываю путь к фиче "Support\Instructions\Core\ДляГенерацииEPF.feature"
	И я создаю EPF по feature файлу
			И     В открытой форме я перехожу к закладке "Генератор EPF"
			И     В открытой форме я изменяю флаг "Генерировать управляемую форму"
			И     В открытой форме я изменяю флаг "Создавать области при генерации кода"
			И     В открытой форме я нажимаю на кнопку "Создать и обновить шаблоны обработок"
			И     В каталоге появилась обработка "Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf"
	
	Тогда я запускаю конфигуратор служебной базы 
	И я открываю в конфигураторе файл "Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf"
	И я открываю основную форму обработки
	И я перехожу на закладку Модуль
	И я сворачиваю область Служебные функции
	И обратите внимание "Обратите внимание: для каждого из трёх шагов сценария было создано по одной процедуре."
	И я перехожу к процедуре "ЯУказалПервоеСлагаемое"
	И я выделяю в тексте 9 строк
	И я закрываю конфигуратор служебной базы
	

	
	
	
	

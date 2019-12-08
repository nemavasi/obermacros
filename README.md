#Obermacros

## Overview

This plugin is designed to be embed dynamic models, process simulators, data visualizations and other tasks using
Oberon-07 programming language in Confluence pages.
Oberon-07 is a very beautiful and concise programming language, the syntax of which can be studied in a few days.
This allows to quickly develop models and visualize models for non-professional programmers.
Oberon-07 is the result of decades of work by Niklaus Wirth - a famous scientist, specialist in the computer science,
and his assistants.

All trademarks are the property of their respective owners.

### Details

In this plugin Oberon-07 code is compiled into JavaScript, which allows you to use it to create and visualize models
directly on the page with other information. The author of the compiler is Vladislav Volts. He also offers other
programming language Eberon, which you can use.

#### Use cases.
- teaching programming and algorithm to schoolchildren and students
- creation of production simulators, warehouse, trade, physical and other processes
- demonstration of algorithms and models in research
- dynamic visualization of mathematical models and processes

The main advantage of this plugin is that it is a very simple, but at the same time, powerful programming language,
that allows you to focus on the current task, and not on the learning of syntax and many libraries.

Access to a site with various models for the language of Oberon-07 here: <br>
https://modela.online

###Warning
Warning!
To save program code in Oberon-07 on the Confluence page, you must have permission to edit the page! Otherwise, the
changes will not be saved! It is done so that no one could changes your model. But at the same time, users can change
characteristics of the model and rerun the model.

### Known Issues

Only one obermacro works on the page.

### Instruction
A macro can be in any page.
First you need to verify that the correct programming language is installed - Oberon-07 or Eberon.
The "OPEN SOURCE CODE" panel is open by default - you can write your own code in it. Your code must contain the Init module.
From your code, modules Math (mathematical operations), Strings (work with strings), Log (logging) and
Draw (drawing) are available. Optionally, you can add your own modules. For example, this can be done simply by
describing another module above the Init module.

After writing the code, you need to start compiling the code using the "Compile" command. It will compile the code from
Oberon-07 into Javascript. If the “OPEN COMPLEX CODE” panel is opened (it opens / closes by clicking), you can see the
result of compilation into JavaScript. Work started by the "Run" command. You can immediately compile and run the code
using the "Compile & Run" command.

It’s easier to start learning using simple code examples on https://modela.online/.

In order for your code to remain on an ongoing basis, you must have permission to edit the page.
First, copy the code you want to save to the clipboard. Go into page editing mode.
In the settings of the element of this macro, find the field for inserting the code. You can also write a comment
in the macro.

For extended help with Oberon-07 or other dialects of Oberon, refer to the source,
available in the "OPEN HELP" menu (opens / closes by clicking) on ​​the page.

Happy experiments!


#Обермакрос

##Обзор 

Данный плагин предназначен для встраивания в страницы Confluence динамических моделей, симуляторов процессов, визуализации 
данных и моделей, написанных на языке программирования Оберон-07. 
Оберон-07 - очень красивый и лаконичный язык программирования, синтаксис которого можно освоить за несколько дней.
Это позволяет быстро разрабатывать модели и визуализацию моделей непрофессиональным программистам.    
Оберон-07 - результат десятилетий труда Никлауса Вирта - известного ученого, специалиста в области информатики. и его 
помощников.  
 
Все торговые марки принадлежат их законным владельцам

###Детали

В данном плагине код Оберон-07 компилируется в JavaScript, что позволяет использовать его для создания и визуализации моделей прямо на странице с другой информацией. 
Автор компилятора - Vladislav Folts. Автор также предлагает свой язык программирования Eberon, который Вы также можете использовать.      

####Варианты использования. 
  - обучение программированию и алгоритмам школьников и студентов
  - создание симуляторов производственных, складских, торговых, физических и других процессов  
  - демонстрация алгоритмов и моделей в исследованиях  
  - динамическая визуализация математических моделей и процессов 
  
Основное преимущество - использование очень простого, но в то же время мощного языка программирования, который 
позволит сосредоточиться на решаемой задаче, а не на освоении синтаксиса и множества библиотек.  

Доступен сайт с различными моделями на языке Оберон-07.<br>
https://modela.online

###Предупреждение
Внимание! 
Для сохранения кода программы на языке Oberon-07 на странице Confluence, необходимо иметь права на редактирование страницы 
(и редактировать сам элемент макроса на странице)! В противном случае изменения не сохранятся! Это сделано для того, чтобы Вашу модель никто не изменил. Но при этом пользователи могут "поиграться" с моделью, меняя данные и код на временной основе.     

###Известные проблемы

Не нужно добавлять более одного такого макроса на страницу - работает только один. 

###Инструкция
Макрос может быть в строен в любую страницу. 
Сначала нужно проверить, что стоит нужный язык программирования - Oberon-07 или Eberon.
Панель "OPEN SOURCE CODE" по умолчанию открыта - в ней можно писать свой код. Ваш код должен содержать модуль Init.
Из Вашего кода доступны модули Math (математические операции), Strings (работа со строками), Log (логгирование) и 
Draw (отрисовка). По желанию можете добавлять свои модули. Например. это можно сделать просто описав другой модуль выше
модуля Init.  

После написания кода нужно запустить компиляцию кода по команде Compile. Она скомпилирует код из Оберон-07 в код
JavaScript. Если при этом раскрыта панель "OPEN COMPILE CODE" (раскрывается/закрывается по клику), можно увидеть результат компиляции в JavaScript. 
Запуск кода запускается командой "Run". Можно сразу скомпилировать и запустить код по команде "Compile & Run".  

Проще начать обучение с разбора простых экземпляра кода на сайте modela.online.   

Для того чтобы Ваш код сохранился на постоянной основе, необходимо иметь права н редактирование страницы. 
Сначала скопируйте код, который хотите сохранить, в буфер обмена. Зайдите в режим редактирования страницы. 
В настройках элемента данного макроса найдите поле для вставки кода. Можете также написать комментарий в макросе.     

Для получения расширенной помощи по языку Оберон-07 или по другим диалектам языка Оберон обратитесь к источникам,
доступным в меню "OPEN HELP" (раскрывается/закрывается по клику) на странице.   

Удачных экспериментов!





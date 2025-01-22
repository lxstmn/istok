![image](https://github.com/user-attachments/assets/9a885762-9354-4d45-95ce-af0c21fb2ae8)
# Что здесь вообще происходит?!

**istok** - это конфигурация для проектирования бэкенда учетных систем на платформе 1С.

Инструмент для бизнес/системных аналитиков, функциональных/технических архитекторов.

Реализованные возможности:
* В пользовательском режиме, без написания кода (no-code), смоделировать все необходимые для учета объекты: реквизиты, таблицы, справочники, документы и регистры.
* Получить единую ER диаграмму всей проектируемой учетной системы с отражением установленных зависимостей между объектам и их атрибутами (типы и проводки).
* Выполнить прогон сценариев использования (use-case) учетной системы на уровне объектов - ввести тестовые данные, проверить их отражение в регистрах.
* Применить свои алгоритмы автоматизации работы бэкенда (low-code).
* Получить и проверить целевые выборки информации и отчеты.
* Ведение версионирования изменений учетной системы.
  
Потенциальные возможности:
* Получение проектной и технической документации в виде стандартизированных отчетов.
* Использование в качестве полноценного бэкенда.

Текущая версия продукта представляет собой MVP (Minimum Viable Product), разработанный для быстрой проверки гипотез и решения ключевых задач. Качество кода на данном этапе не является приоритетом, так как основная цель — проверить востребованность продукта и его способность решать поставленные задачи. Если продукт докажет свою ценность, код будет улучшен и оптимизирован. Сейчас фокус на том, какие проблемы решает продукт и насколько он полезен для пользователей. Ваши отзывы и предложения помогут определить правильный вектор развития продукта.

В репозитарии находятся файлы, полученные путем выгрузки конфигруации в файлы.

Конфигурация разработана и протестирована на платформе 1С 8.3.25.1286, установлен режим совместимости с версией 8.3.24.

# Как с этим работать?

При запуске конфигурации доступны три раздела: Главное, Настройки и Хранилища.

### Настройки
1) **Колонки объектов.** Справочник, содержащий колонки объектов, которые можно использовать для описания реквизитного состава объектов системы. Один и тот же элемент этого справочника может быть использован в разных объектах. В справочнике имеются несколько предопределенных системных элементов, например код, дата, ссылка, основание и т.п.
![image](https://github.com/user-attachments/assets/ceaef6f6-29e8-4731-a197-9f14c3e0f2d3)
    * Простые типы заводятся путем выбора соответствующего типа значения.
    * Ссылочные типы заводятся путем выбора типа значения "Элементы объектов системы" и указанием ограничений в таблице "Доступные объекты системы" нужных объектов системы.
    * Составные типы заводятся стандартным путем указания нескольких типов в поле выбора типа значения. Если требуется выбор из нескольких объектов системы, то необходимо внести нужные значения в таблице "Доступные объекты системы" (при выбраном типе "Элементы объектов системы").
3) **Объекты системы.** Справочник, содержащий настройки основных объектов учетной системы: таблицы, справочники, документы. Для создания таблицы, справоычника или документа необходимо выбрать соответствующее значение в поле "Тип объекта".
![image](https://github.com/user-attachments/assets/3c83e8e1-830b-4168-b8c0-30d6fd65cb72)
    * Таблица. Служит для описания таблицы значений, которая может быть использвана в описании справочников и документов. В колонках выбираются значения из справочника "Колонки объектов".
    * Справочник и Документ. Схожие по функционалу типы объектов. Для них можно выбрать колонки (реквизиты), таблицы, настроить основания и проведение.
    * Пакет. Предназначен для описания входящий информации из внешней системы (описание интеграции). Для этой же цели в справочнике и документе есть возможность указать источники.
5) **Варианты объектов системы.** Справочник, позволяющий в рамках одного объекта системы организовать разную логику его поведения.   
7) **Разрезы данных.**
8) Другие системные объекты
     * **Константы и настройки.** Справочник, созданный для хранения различных настроек, которые могут понадобится при реализации алгоритмов.
     * **Разделы учета.** Справочник, необходимый для разделения объектов системы на функциональные группы. Что использования в отборах при построении отчетов-документации.
     * **Алгоритмы.** Справочник, необходимый для хранения применяемых алгоритмов.
9) **Анализ структуры БД.** Обработка, предназначенная для вывода единой ER диаграммы всей проектируемой учетной системы с отражением установленных зависимостей между объектам и их атрибутами (типы и проводки).
![СтруктураБД](https://github.com/user-attachments/assets/9b8cc2de-e412-48e7-8305-98dd5410bf50)
С левой стороны выводятся зависимости по типу данных. С правой стороны отражаются выполняемые проводки.

### Хранилища
1) Хранилище значений колонок объектов
2) Активность строк таблиц
3) *Строки таблиц*

### Главное
1) Элементы объектов системы

#   

**istok** - бэкенд начинается с тебя


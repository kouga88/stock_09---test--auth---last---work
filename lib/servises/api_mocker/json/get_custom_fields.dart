const getCustomFields = r'''[
    {
        "id": 4,
        "name": "Адрес подключения",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 5,
        "name": "К/Т - для связи",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 7,
        "name": "Комментарий с порта",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 10,
        "name": "Строение/Дом",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 11,
        "name": "Квартира",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 12,
        "name": "Лицевой счет",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 14,
        "name": "Узел Связи",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 15,
        "name": "Доступ к ящику",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 16,
        "name": "Тип и размер ящика",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 17,
        "name": "Освещение внутри ящика",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 18,
        "name": "Освещение снаружи",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 19,
        "name": "Доступ в подъезд",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 20,
        "name": "Питание к ящику",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 21,
        "name": "Кол-во розеток 220",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 22,
        "name": "Блок силовых розеток (пилот)",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 23,
        "name": "Коммутаторы",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 24,
        "name": "Координаты",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 30,
        "name": "Краткое наименование",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 31,
        "name": "Скорость Мбит/с",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 33,
        "name": "Единовременный платеж",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 34,
        "name": "Абонентская плата, руб/месяц ",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 35,
        "name": "Предоставить оборудование",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 37,
        "name": "Эл.почта для счетов",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 38,
        "name": "ФИО бухгалтера, контакт",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 39,
        "name": "Адрес доставки документов",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 42,
        "name": "Номер договора",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 46,
        "name": "Ф.И.О",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 48,
        "name": "VLAN ID",
        "possible_values": null,
        "default_value": ""
    },
    {
        "id": 2,
        "name": "Категория абонента",
        "possible_values": [
            "---",
            "физ.лицо",
            "юр.лицо"
        ],
        "default_value": ""
    },
    {
        "id": 3,
        "name": "Тип Подключения",
        "possible_values": [
            "---",
            "Беспроводные - wi-fi",
            "Витая пара - ethernet",
            "Оптика - EPON/GPON",
            "Оптика - WDM"
        ],
        "default_value": ""
    },
    {
        "id": 32,
        "name": "Статический IP адрес",
        "possible_values": [
            "---",
            "Да",
            "Нет\n"
        ],
        "default_value": ""
    },
    {
        "id": 6,
        "name": "Порт Подключения",
        "possible_values": [
            "---",
            "Оптика - EPON/GPON  глаз 0",
            "Оптика - EPON/GPON  глаз 1",
            "Оптика - EPON/GPON  глаз 2",
            "Оптика - EPON/GPON  глаз 3",
            "Оптика - EPON/GPON  глаз 4",
            "Оптика - EPON/GPON  глаз 5",
            "Оптика - EPON/GPON  глаз 6",
            "Оптика - EPON/GPON  глаз 7",
            "Оптика - EPON/GPON  глаз 8",
            "Оптика - EPON/GPON  глаз 9",
            "Оптика - EPON/GPON  глаз 10",
            "Оптика - EPON/GPON  глаз 11",
            "Оптика - EPON/GPON  глаз 12",
            "Оптика - EPON/GPON  глаз 13",
            "Оптика - EPON/GPON  глаз 14",
            "Оптика - EPON/GPON  глаз 15",
            "Оптика - EPON/GPON  глаз 16",
            "Витая пара - ethernet  1",
            "Витая пара - ethernet  2",
            "Витая пара - ethernet  3",
            "Витая пара - ethernet  4",
            "Витая пара - ethernet  5",
            "Витая пара - ethernet  6",
            "Витая пара - ethernet  7",
            "Витая пара - ethernet  8",
            "Витая пара - ethernet  9",
            "Витая пара - ethernet  10",
            "Витая пара - ethernet  11",
            "Витая пара - ethernet  12",
            "Витая пара - ethernet  13",
            "Витая пара - ethernet  14",
            "Витая пара - ethernet  15",
            "Витая пара - ethernet  16",
            "Витая пара - ethernet  17",
            "Витая пара - ethernet  18",
            "Витая пара - ethernet  19",
            "Витая пара - ethernet  20",
            "Витая пара - ethernet  21",
            "Витая пара - ethernet  22",
            "Витая пара - ethernet  23",
            "Витая пара - ethernet  24",
            "Витая пара - ethernet  25",
            "Витая пара - ethernet  26",
            "Витая пара - ethernet  27",
            "Витая пара - ethernet  28",
            "Витая пара - ethernet  29",
            "Витая пара - ethernet  30",
            "Витая пара - ethernet  31",
            "Витая пара - ethernet  32",
            "Витая пара - ethernet  33",
            "Витая пара - ethernet  34",
            "Витая пара - ethernet  35",
            "Витая пара - ethernet  36",
            "Витая пара - ethernet  37",
            "Витая пара - ethernet  38",
            "Витая пара - ethernet  39",
            "Витая пара - ethernet  40",
            "Витая пара - ethernet  41",
            "Витая пара - ethernet  42",
            "Витая пара - ethernet  43",
            "Витая пара - ethernet  44",
            "Витая пара - ethernet  45",
            "Витая пара - ethernet  46",
            "Витая пара - ethernet  47",
            "Витая пара - ethernet  48",
            "Витая пара - ethernet  49",
            "Витая пара - ethernet  50",
            "Витая пара - ethernet  51",
            "Витая пара - ethernet  52",
            "Оптика - WDM порт - 1",
            "Оптика - WDM порт - 2",
            "Оптика - WDM порт - 3",
            "Оптика - WDM порт - 4",
            "Оптика - WDM порт - 5",
            "Оптика - WDM порт - 6",
            "Оптика - WDM порт - 7",
            "Оптика - WDM порт - 8",
            "Оптика - WDM порт - 9",
            "Оптика - WDM порт - 10",
            "Оптика - WDM порт - 11",
            "Оптика - WDM порт - 12",
            "Оптика - WDM порт - 13",
            "Оптика - WDM порт - 14",
            "Оптика - WDM порт - 15",
            "Оптика - WDM порт - 16",
            "Оптика - WDM порт - 17",
            "Оптика - WDM порт - 18",
            "Оптика - WDM порт - 19",
            "Оптика - WDM порт - 20",
            "Оптика - WDM порт - 21",
            "Оптика - WDM порт - 22",
            "Оптика - WDM порт - 23",
            "Оптика - WDM порт - 24",
            "Оптика - WDM порт - 25",
            "Оптика - WDM порт - 26",
            "Оптика - WDM порт - 27",
            "Оптика - WDM порт - 28",
            "Оптика - WDM порт - 29",
            "Оптика - WDM порт - 30",
            "Оптика - WDM порт - 31",
            "Оптика - WDM порт - 32",
            "Оптика - WDM порт - 33",
            "Оптика - WDM порт - 34",
            "Оптика - WDM порт - 35",
            "Оптика - WDM порт - 36",
            "Оптика - WDM порт - 37",
            "Оптика - WDM порт - 38",
            "Оптика - WDM порт - 39",
            "Оптика - WDM порт - 40",
            "Оптика - WDM порт - 41",
            "Оптика - WDM порт - 42",
            "Оптика - WDM порт - 43",
            "Оптика - WDM порт - 44",
            "Оптика - WDM порт - 45",
            "Оптика - WDM порт - 46",
            "Оптика - WDM порт - 47",
            "Оптика - WDM порт - 48",
            "Оптика - WDM порт - 49",
            "Оптика - WDM порт - 50",
            "Оптика - WDM порт - 51",
            "Оптика - WDM порт - 52",
            "Беспроводные - wi-fi - AP",
            "Беспроводные - wi-fi - ST\n"
        ],
        "default_value": ""
    },
    {
        "id": 29,
        "name": "Услуга",
        "possible_values": [
            "---",
            "Интернет",
            "Телевидение",
            "Интернет+Тв",
            "Статический-ip",
            "Канал связи",
            "Видеонаблюдение",
            "Домофон",
            "Охрана\n"
        ],
        "default_value": "Интернет"
    },
    {
        "id": 36,
        "name": "Способ доставки документов",
        "possible_values": [
            "---",
            "Почта РФ",
            "Курьер",
            "Эл.почта",
            "ЭДО",
            "WhatsApp\n"
        ],
        "default_value": ""
    },
    {
        "id": 40,
        "name": "Активация",
        "possible_values": [
            "---",
            "Обещанный платеж на 5 дней",
            "Кредит 1 абон.плата",
            "Кредит 2 абон.платы",
            "Блокировка после включения\n"
        ],
        "default_value": ""
    },
    {
        "id": 43,
        "name": "Тип заявления",
        "possible_values": [
            "---",
            "Физ.лицо за ИП",
            "Физ.лицо за ООО",
            "ИП за ИП",
            "ИП за ООО",
            "ООО за ООО",
            "ООО за ИП\n"
        ],
        "default_value": ""
    },
    {
        "id": 44,
        "name": "Тип заявления.",
        "possible_values": [
            "---",
            "с ИП на ООО",
            "с ИП на ИП",
            "с ООО на ООО",
            "с ООО на ИП\n"
        ],
        "default_value": ""
    },
    {
        "id": 47,
        "name": "VLAN",
        "possible_values": [
            "---",
            "Новый (Создаем новый VLAN)",
            "Существующий (Добавляем в уже существующий VLAN)\n"
        ],
        "default_value": ""
    },
    {
        "id": 49,
        "name": "Тип порта VLAN",
        "possible_values": [
            "---",
            "ACCESS",
            "TRUNK\n"
        ],
        "default_value": "ACCESS"
    },
    {
        "id": 50,
        "name": "Организация линии",
        "possible_values": [
            "---",
            "За счет Оператора-1 (ООО \"Проводов нет\")",
            "За счет Оператора-2",
            "Не требуется\n"
        ],
        "default_value": "Не требуется"
    },
    {
        "id": 51,
        "name": "Уровень присоединения",
        "possible_values": [
            "---",
            "Узловой",
            "Абонентский\n"
        ],
        "default_value": "Узловой"
    },
    {
        "id": 52,
        "name": "Тип SFP модулей",
        "possible_values": [
            "---",
            "SFP/SC",
            "SFP/LC",
            "SFP/RJ-45 (1000BASE-T)",
            "SFP+/LC",
            "SFP+/LC (2 волокна)",
            "Без SFP (RJ-45 порт на коммутаторе)\n"
        ],
        "default_value": "SFP/SC"
    }
]''';
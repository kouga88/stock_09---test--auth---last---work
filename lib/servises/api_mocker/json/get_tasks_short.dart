const getTasksShort = r'''{
    "limit": 0,
    "offset": 0,
    "count_all": 1100,
    "tasks": [
        {
            "id": 2,
            "title": "ФЛ, ул.Пролетарская, д.8",
            "description": "к.т.8 900 28 45 898",
            "assigned": {
                "id": 56,
                "lastname": "Абон.отдел ",
                "firstname": ""
            },
            "author": {
                "id": 5,
                "lastname": "Марина",
                "firstname": "Бабенко"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-21T16:19:41",
            "updated_on": "2023-10-21T22:13:04",
            "closed_on": null,
            "tracker": {
                "id": 4,
                "name": "Планируемые"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 1,
                "name": "Новая"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 3,
            "title": "Новый проект",
            "description": "Установка настройка серверов",
            "assigned": null,
            "author": {
                "id": 3,
                "lastname": "Черников",
                "firstname": "Алексей"
            },
            "done_ratio": 100,
            "completed_on": null,
            "created_on": "2023-10-22T10:09:54",
            "updated_on": "2023-10-22T23:18:31",
            "closed_on": null,
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 1,
                "name": "Новая"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 4,
            "title": "Прокладка ЛВС",
            "description": "Необходимо проложить:\r\n1) ЛВС по офису\r\n2) электрику в серверную\r\n",
            "assigned": {
                "id": 11,
                "lastname": "Бородин",
                "firstname": "Василий"
            },
            "author": {
                "id": 3,
                "lastname": "Черников",
                "firstname": "Алексей"
            },
            "done_ratio": 100,
            "completed_on": null,
            "created_on": "2023-10-22T10:14:46",
            "updated_on": "2023-10-23T23:18:31",
            "closed_on": null,
            "tracker": {
                "id": 7,
                "name": "Монтажные работы"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 2,
                "name": "В работе"
            },
            "priority": {
                "id": 1,
                "name": "Низкая"
            }
        },
        {
            "id": 5,
            "title": "Сборка стойки",
            "description": "Сборка установка стойки, монтаж ЛВС в стойку",
            "assigned": {
                "id": 11,
                "lastname": "Бородин",
                "firstname": "Василий"
            },
            "author": {
                "id": 3,
                "lastname": "Черников",
                "firstname": "Алексей"
            },
            "done_ratio": 100,
            "completed_on": null,
            "created_on": "2023-10-23T10:50:38",
            "updated_on": "2023-10-23T19:02:28",
            "closed_on": null,
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 3,
                "name": "Решена"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 6,
            "title": "Установка  серверов и настройка XEN server и объединение в пул ",
            "description": "Установка и настройка пула. \r\nРазвернуть тестовую виртуальку  и по тестировать \"живую\" миграцию.",
            "assigned": {
                "id": 7,
                "lastname": "Тех.поддержка",
                "firstname": ""
            },
            "author": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-21T10:34:53",
            "updated_on": "2023-10-21T13:17:38",
            "closed_on": null,
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 4,
                "name": "Обратная связь"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 7,
            "title": "Перенос основных сервисов",
            "description": "Перенос основных сервисов\r\n",
            "assigned": {
                "id": 7,
                "lastname": "Тех.поддержка",
                "firstname": ""
            },
            "author": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "done_ratio": 100,
            "completed_on": null,
            "created_on": "2023-10-24T12:52:05",
            "updated_on": "2023-10-24T15:04:13",
            "closed_on": null,
            "tracker": {
                "id": 2,
                "name": "Тех.Поддержка"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 6,
                "name": "Отклонена"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 8,
            "title": "Cacti",
            "description": "Перенос с сервера 10.40.0.201  или не получится не перерисовать",
            "assigned": {
                "id": 12,
                "lastname": "Корепов",
                "firstname": "Евгений"
            },
            "author": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-25T12:57:08",
            "updated_on": "2023-10-25T13:16:42",
            "closed_on": null,
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 7,
                "name": "Ожидание"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 9,
            "title": "Radius, backup",
            "description": "",
            "assigned": {
                "id": 7,
                "lastname": "Тех.поддержка",
                "firstname": ""
            },
            "author": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-26T13:48:27",
            "updated_on": "2023-10-26T13:17:08",
            "closed_on": null,
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 8,
                "name": "Открыта"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 10,
            "title": "WWW, mail",
            "description": "",
            "assigned": {
                "id": 3,
                "lastname": "Черников",
                "firstname": "Алексей"
            },
            "author": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-25T14:12:14",
            "updated_on": "2023-10-25T13:16:17",
            "closed_on": null,
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 9,
                "name": "Плановые Работы"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 11,
            "title": "DNS, DHCP",
            "description": "",
            "assigned": null,
            "author": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-21T14:21:51",
            "updated_on": "2023-10-21T13:18:02",
            "closed_on": "2023-10-23T13:18:02",
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 5,
                "name": "Закрыта"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 13,
            "title": "высвечивание ОВ с ул.Депутатская на ул. Набережная(ОВ для Адмиралтейского)",
            "description": "По высвечиванию ОВ на ул набережная с депутатской проводились в 2016 году. По схеме в \"ДЕК 22\" приходит синее волокно, на схеме подписано как \"резерв\". Необходимо его проверить, снять рефлектограмму и проварить с кабелем на ЖК Адмиралтейский. Судя по схеме, на Олимпийском 14 порт как раз таки и сварен с этим резервом. Тобеж просветив в 14 порт на олимпийском, мы должны увидеть свет на синем волокне в муфте \"ДЕК 22\". Работы можно проводить рано утром. Необходимо запланировать работы!",
            "assigned": {
                "id": 11,
                "lastname": "Бородин",
                "firstname": "Василий"
            },
            "author": {
                "id": 11,
                "lastname": "Бородин",
                "firstname": "Василий"
            },
            "done_ratio": 100,
            "completed_on": null,
            "created_on": "2023-10-21T07:37:37",
            "updated_on": "2023-10-21T19:03:06",
            "closed_on": "2023-10-21T11:38:22",
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 5,
                "name": "Закрыта"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 14,
            "title": "Видеонаблюдение у Аслана во дворе(Гагарина 144/1 к 1)",
            "description": "Для видеонаблюдения нам надо:\r\n-закупить аппаратуру для реализации видеонаблюдения \r\n-договориться с управляющим где разместить ящик и предложить вариант подвода ОК к ящику, а также разводка кабелей под видеонаблюдение.\r\n-выявить варианты подачи линка на этот дом\r\n-установить ящик с аппаратурой\r\n-разводка кабеля под камеры+монтаж камер+подача линка на DVR\r\n-пуско-наладочные работы.\r\nМатериал: Ящик антивандальный(швг(520*320*400)), автомат электрический, счетчик электрический, кросс настенный на 8 портов и комплектующие к нему, бирп, АКБ, кабель-канал(40*20), коммутатор, sfp модуль(пара), ОК 8f поновский,зажим н3,дюбель-хомут-2 пачки,ВВГнГ 3*1.5 мм, FTP - 1000 м. Срок выполнения работы от 2 до 3 рабочих дней двум монтажникам.необходимо запланировать выполнение задачи! ",
            "assigned": {
                "id": 4,
                "lastname": "Кушу",
                "firstname": "Аслан"
            },
            "author": {
                "id": 11,
                "lastname": "Бородин",
                "firstname": "Василий"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-25T07:58:48",
            "updated_on": "2023-10-25T12:49:40",
            "closed_on": null,
            "tracker": {
                "id": 1,
                "name": "Общие задачи "
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 2,
                "name": "В работе"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 15,
            "title": "ФЛ, ул.Цветочная, д.65",
            "description": "к.т.8 938 515 63 05 (ранее л/сч.3821)",
            "assigned": {
                "id": 56,
                "lastname": "Абон.отдел ",
                "firstname": ""
            },
            "author": {
                "id": 5,
                "lastname": "Марина",
                "firstname": "Бабенко"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-21T17:42:22",
            "updated_on": "2023-10-21T22:13:04",
            "closed_on": "2023-10-21T11:02:29",
            "tracker": {
                "id": 4,
                "name": "Планируемые"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 5,
                "name": "Закрыта"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 16,
            "title": "ФЛ, ул.Совхозная, д.27",
            "description": "к.т.8 918 2 333 223 Александр",
            "assigned": {
                "id": 23,
                "lastname": "Бортников",
                "firstname": "Николай"
            },
            "author": {
                "id": 5,
                "lastname": "Марина",
                "firstname": "Бабенко"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-21T09:11:49",
            "updated_on": "2023-10-21T14:39:00",
            "closed_on": "2023-10-21T14:39:00",
            "tracker": {
                "id": 4,
                "name": "Планируемые"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 5,
                "name": "Закрыта"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 17,
            "title": "п.Яблоновский, 2-й пр.Герцена, д.4",
            "description": "к.т. 8 918 480 60 83",
            "assigned": {
                "id": 56,
                "lastname": "Абон.отдел ",
                "firstname": ""
            },
            "author": {
                "id": 5,
                "lastname": "Марина",
                "firstname": "Бабенко"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-21T17:00:07",
            "updated_on": "2023-10-21T13:56:09",
            "closed_on": null,
            "tracker": {
                "id": 4,
                "name": "Планируемые"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 2,
                "name": "В работе"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 18,
            "title": "ФЛ, ул.Промышленная, д.57, 66",
            "description": "к.т. 8 961 856 86 22",
            "assigned": {
                "id": 56,
                "lastname": "Абон.отдел ",
                "firstname": ""
            },
            "author": {
                "id": 5,
                "lastname": "Марина",
                "firstname": "Бабенко"
            },
            "done_ratio": 0,
            "completed_on": null,
            "created_on": "2023-10-21T15:43:27",
            "updated_on": "2023-10-21T22:18:44",
            "closed_on": "2023-10-21T15:37:52",
            "tracker": {
                "id": 4,
                "name": "Планируемые"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 5,
                "name": "Закрыта"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 19,
            "title": "ФЛ, ул.Молодежная, д.47",
            "description": "к.т.8 918 044 60 61",
            "assigned": {
                "id": 11,
                "lastname": "Бородин",
                "firstname": "Василий"
            },
            "author": {
                "id": 5,
                "lastname": "Марина",
                "firstname": "Бабенко"
            },
            "done_ratio": 100,
            "completed_on": null,
            "created_on": "2023-10-21T15:08:37",
            "updated_on": "2023-10-21T16:32:19",
            "closed_on": "2023-10-21T15:08:33",
            "tracker": {
                "id": 4,
                "name": "Планируемые"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 5,
                "name": "Закрыта"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 20,
            "title": "установить 2 - а новых Mikrotika ",
            "description": "Давай поставить 2 микротика и разгрузим ещё 2 микротика. \r\n\r\n\r\nпервый Микротик - это Дорожная 63 \r\nвторой Микротик - это Бжегокайская",
            "assigned": {
                "id": 13,
                "lastname": "Туманов",
                "firstname": "Дмитрий"
            },
            "author": {
                "id": 13,
                "lastname": "Туманов",
                "firstname": "Дмитрий"
            },
            "done_ratio": 50,
            "completed_on": null,
            "created_on": "2023-10-21T11:36:18",
            "updated_on": "2023-10-21T16:01:55",
            "closed_on": "2023-10-21T16:01:55",
            "tracker": {
                "id": 2,
                "name": "Тех.Поддержка"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 5,
                "name": "Закрыта"
            },
            "priority": {
                "id": 3,
                "name": "Высокий"
            }
        },
        {
            "id": 21,
            "title": "Развернуть новый syslog сервер",
            "description": "Развернуть новый syslog сервер с интерфейсом LogAnalyzer.\r\nСвязка Rsyslog+mysql+LogAnalyzer",
            "assigned": {
                "id": 12,
                "lastname": "Корепов",
                "firstname": "Евгений"
            },
            "author": {
                "id": 12,
                "lastname": "Корепов",
                "firstname": "Евгений"
            },
            "done_ratio": 100,
            "completed_on": null,
            "created_on": "2023-10-23T09:38:23",
            "updated_on": "2023-10-23T15:38:08",
            "closed_on": null,
            "tracker": {
                "id": 2,
                "name": "Тех.Поддержка"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 1,
                "name": "Новая"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        },
        {
            "id": 22,
            "title": "Развернуть новый radius сервер",
            "description": "Новый радиус для авторизации на сетевом оборудовании",
            "assigned": {
                "id": 12,
                "lastname": "Корепов",
                "firstname": "Евгений"
            },
            "author": {
                "id": 12,
                "lastname": "Корепов",
                "firstname": "Евгений"
            },
            "done_ratio": 50,
            "completed_on": null,
            "created_on": "2023-10-21T09:42:13",
            "updated_on": "2023-10-21T14:29:55",
            "closed_on": null,
            "tracker": {
                "id": 2,
                "name": "Тех.Поддержка"
            },
            "project": {
                "id": 1,
                "name": "Проводов.нет"
            },
            "status": {
                "id": 7,
                "name": "Ожидание"
            },
            "priority": {
                "id": 2,
                "name": "Нормальный"
            }
        }
    ]
  }''';
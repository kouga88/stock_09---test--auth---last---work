const getTasks = r'''[
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
        "created_on": "2017-06-27T16:19:41",
        "updated_on": "2018-08-15T22:13:04",
        "closed_on": "2017-09-14T15:29:42",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 224,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "какой результат?\r\nв планируемые или че делаем с заявкой??",
                "created_on": "2017-08-11T16:16:47",
                "edited_on": "2017-08-11T16:16:47",
                "details": []
            },
            {
                "id": 630,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-24T10:46:51",
                "edited_on": "2017-08-24T10:46:51",
                "details": [
                    {
                        "id": 564,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "3",
                        "value": "4"
                    },
                    {
                        "id": 565,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 785,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "сроки пока не определены",
                "created_on": "2017-08-28T16:37:22",
                "edited_on": "2017-08-28T16:37:22",
                "details": []
            },
            {
                "id": 1540,
                "user": {
                    "id": 10,
                    "lastname": "Кравченко",
                    "firstname": "Татьяна"
                },
                "notes": "",
                "created_on": "2017-09-14T15:29:42",
                "edited_on": "2017-09-14T15:29:42",
                "details": [
                    {
                        "id": 1389,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "7",
                        "value": "5"
                    },
                    {
                        "id": 1390,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "6",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1290,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-09-11T10:43:01",
                "edited_on": "2017-09-11T10:43:01",
                "details": [
                    {
                        "id": 1144,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "11",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1528,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "технической возможности нет.",
                "created_on": "2017-09-14T14:34:43",
                "edited_on": "2017-09-14T14:34:43",
                "details": [
                    {
                        "id": 1373,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "6"
                    }
                ]
            },
            {
                "id": 22775,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": null,
                "created_on": "2018-08-15T22:13:04",
                "edited_on": "2018-08-15T22:13:04",
                "details": [
                    {
                        "id": 28295,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "56"
                    }
                ]
            }
        ],
        "custom_values": [
            {
                "id": 1,
                "value": "",
                "custom_field": {
                    "id": 2,
                    "name": "Категория абонента"
                }
            },
            {
                "id": 2,
                "value": "",
                "custom_field": {
                    "id": 3,
                    "name": "Тип Подключения"
                }
            },
            {
                "id": 3,
                "value": "",
                "custom_field": {
                    "id": 4,
                    "name": "Адрес подключения"
                }
            },
            {
                "id": 4,
                "value": "",
                "custom_field": {
                    "id": 5,
                    "name": "К/Т - для связи"
                }
            }
        ]
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
        "created_on": "2017-06-29T10:09:54",
        "updated_on": "2017-11-03T23:18:31",
        "closed_on": "2017-07-21T13:19:20",
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
        },
        "is_private": null,
        "parent": null,
        "children": [
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
                "created_on": "2017-06-29T10:14:46",
                "updated_on": "2017-11-03T23:18:31",
                "closed_on": "2017-09-13T11:06:23",
                "tracker": {
                    "id": 7,
                    "name": "Монтажные работы"
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
                "created_on": "2017-06-29T10:50:38",
                "updated_on": "2017-10-18T19:02:28",
                "closed_on": "2017-07-21T13:18:44",
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
                "created_on": "2017-06-30T10:34:53",
                "updated_on": "2017-07-21T13:17:38",
                "closed_on": "2017-07-21T13:17:38",
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
                "created_on": "2017-06-30T12:52:05",
                "updated_on": "2017-08-09T15:04:13",
                "closed_on": "2017-08-09T15:04:13",
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
                    "id": 2,
                    "name": "Нормальный"
                }
            }
        ],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 18,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-07-21T13:19:20",
                "edited_on": "2017-07-21T13:19:20",
                "details": [
                    {
                        "id": 24,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-29T10:14:46",
        "updated_on": "2017-11-03T23:18:31",
        "closed_on": "2017-09-13T11:06:23",
        "tracker": {
            "id": 7,
            "name": "Монтажные работы"
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
            "id": 1,
            "name": "Низкая"
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-29T10:09:54",
            "updated_on": "2017-11-03T23:18:31",
            "closed_on": "2017-07-21T13:19:20",
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
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 3,
                "user": {
                    "id": 3,
                    "lastname": "Черников",
                    "firstname": "Алексей"
                },
                "notes": "",
                "created_on": "2017-06-29T10:47:41",
                "edited_on": "2017-06-29T10:47:41",
                "details": [
                    {
                        "id": 3,
                        "property": "attr",
                        "prop_key": "description",
                        "old_value": "Необходимо проложить ЛВС по офису",
                        "value": "Необходимо проложить:\r\n1) ЛВС по офису\r\n2) электрику в серверную\r\n"
                    },
                    {
                        "id": 4,
                        "property": "attr",
                        "prop_key": "parent_id",
                        "old_value": null,
                        "value": "3"
                    }
                ]
            },
            {
                "id": 121,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "работы выполнены на 80%. Осталась одна розетка в аппаратной комнате, для сплит-системы. И блок из 5 розеток встраиваемых в кабель-канал для бухгалтера. Сегодня постараюсь заказать розетки.",
                "created_on": "2017-08-08T12:59:52",
                "edited_on": "2017-08-08T12:59:52",
                "details": []
            },
            {
                "id": 122,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "заказаны лотки для прокладки кабеля в серверную. Отправил счет на почту Аслану и Наталье.",
                "created_on": "2017-08-08T13:13:12",
                "edited_on": "2017-08-08T13:13:12",
                "details": []
            },
            {
                "id": 212,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-08-11T11:36:18",
                "edited_on": "2017-08-11T11:36:18",
                "details": [
                    {
                        "id": 188,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "11",
                        "value": "4"
                    }
                ]
            },
            {
                "id": 225,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "позвонили с магазина, я заберу в понедельник.",
                "created_on": "2017-08-11T16:17:49",
                "edited_on": "2017-08-11T16:17:49",
                "details": []
            },
            {
                "id": 386,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "привез 14.08.\r\nкогда смонтируем лотки??",
                "created_on": "2017-08-17T16:03:39",
                "edited_on": "2017-08-17T16:03:39",
                "details": []
            },
            {
                "id": 413,
                "user": {
                    "id": 2,
                    "lastname": "Anonymous",
                    "firstname": ""
                },
                "notes": "",
                "created_on": "2017-08-18T10:28:44",
                "edited_on": "2017-08-18T10:28:44",
                "details": [
                    {
                        "id": 354,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "4",
                        "value": "11"
                    }
                ]
            },
            {
                "id": 414,
                "user": {
                    "id": 2,
                    "lastname": "Anonymous",
                    "firstname": ""
                },
                "notes": "Жду сроков когда//?///",
                "created_on": "2017-08-18T10:29:36",
                "edited_on": "2017-08-18T10:29:36",
                "details": []
            },
            {
                "id": 441,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "",
                "created_on": "2017-08-18T18:53:44",
                "edited_on": "2017-08-18T18:53:44",
                "details": [
                    {
                        "id": 385,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "1",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 667,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "Смонтируйте лоток и соедините оптич и медн патч-ми",
                "created_on": "2017-08-24T13:06:33",
                "edited_on": "2017-08-24T13:06:33",
                "details": [
                    {
                        "id": 606,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "11",
                        "value": "23"
                    }
                ]
            },
            {
                "id": 668,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "",
                "created_on": "2017-08-24T13:06:45",
                "edited_on": "2017-08-24T13:06:45",
                "details": [
                    {
                        "id": 607,
                        "property": "attr",
                        "prop_key": "priority_id",
                        "old_value": "2",
                        "value": "4"
                    }
                ]
            },
            {
                "id": 846,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "Лоток смонтирован протянута между лотками много парка ",
                "created_on": "2017-08-29T11:55:58",
                "edited_on": "2017-08-29T11:55:58",
                "details": []
            },
            {
                "id": 848,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "ожидаем патч панель для кроссеровки \r\n",
                "created_on": "2017-08-29T11:57:39",
                "edited_on": "2017-08-29T11:57:39",
                "details": []
            },
            {
                "id": 1204,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "работы планируем на 11.09 понедельник проводить.",
                "created_on": "2017-09-08T14:17:18",
                "edited_on": "2017-09-08T14:17:18",
                "details": []
            },
            {
                "id": 1194,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-09-08T12:34:18",
                "edited_on": "2017-09-08T12:34:18",
                "details": [
                    {
                        "id": 1054,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "23",
                        "value": "11"
                    }
                ]
            },
            {
                "id": 1417,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "Все работы выполненны.",
                "created_on": "2017-09-13T11:06:23",
                "edited_on": "2017-09-13T11:06:23",
                "details": [
                    {
                        "id": 1275,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    },
                    {
                        "id": 1276,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "0",
                        "value": "100"
                    }
                ]
            },
            {
                "id": 4161,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-11-03T23:18:31",
                "edited_on": "2017-11-03T23:18:31",
                "details": [
                    {
                        "id": 4236,
                        "property": "attr",
                        "prop_key": "priority_id",
                        "old_value": "4",
                        "value": "1"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-29T10:50:38",
        "updated_on": "2017-10-18T19:02:28",
        "closed_on": "2017-07-21T13:18:44",
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
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-29T10:09:54",
            "updated_on": "2017-11-03T23:18:31",
            "closed_on": "2017-07-21T13:19:20",
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
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 4,
                "user": {
                    "id": 3,
                    "lastname": "Черников",
                    "firstname": "Алексей"
                },
                "notes": "",
                "created_on": "2017-06-29T11:06:12",
                "edited_on": "2017-06-29T11:06:12",
                "details": []
            },
            {
                "id": 17,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-07-21T13:18:44",
                "edited_on": "2017-07-21T13:18:44",
                "details": [
                    {
                        "id": 23,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            },
            {
                "id": 3251,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-10-18T19:02:28",
                "edited_on": "2017-10-18T19:02:28",
                "details": [
                    {
                        "id": 3304,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "0",
                        "value": "100"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-30T10:34:53",
        "updated_on": "2017-07-21T13:17:38",
        "closed_on": "2017-07-21T13:17:38",
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
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-29T10:09:54",
            "updated_on": "2017-11-03T23:18:31",
            "closed_on": "2017-07-21T13:19:20",
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
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 5,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-06-30T12:37:30",
                "edited_on": "2017-06-30T12:37:30",
                "details": [
                    {
                        "id": 7,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "3",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 15,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-07-21T13:17:38",
                "edited_on": "2017-07-21T13:17:38",
                "details": [
                    {
                        "id": 21,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-30T12:52:05",
        "updated_on": "2017-08-09T15:04:13",
        "closed_on": "2017-08-09T15:04:13",
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
            "id": 2,
            "name": "Нормальный"
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-29T10:09:54",
            "updated_on": "2017-11-03T23:18:31",
            "closed_on": "2017-07-21T13:19:20",
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
        "children": [
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
                "created_on": "2017-06-30T12:57:08",
                "updated_on": "2017-07-21T13:16:42",
                "closed_on": "2017-07-21T13:16:42",
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
                "created_on": "2017-06-30T13:48:27",
                "updated_on": "2017-07-21T13:17:08",
                "closed_on": "2017-07-21T13:17:08",
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
                "created_on": "2017-06-30T14:12:14",
                "updated_on": "2017-07-21T13:16:17",
                "closed_on": "2017-07-21T13:16:17",
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
                "created_on": "2017-06-30T14:21:51",
                "updated_on": "2017-07-21T13:18:02",
                "closed_on": "2017-07-21T13:18:02",
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
            }
        ],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 6,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-06-30T12:52:58",
                "edited_on": "2017-06-30T12:52:58",
                "details": [
                    {
                        "id": 9,
                        "property": "attr",
                        "prop_key": "parent_id",
                        "old_value": null,
                        "value": "3"
                    }
                ]
            },
            {
                "id": 145,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-08-09T15:04:13",
                "edited_on": "2017-08-09T15:04:13",
                "details": [
                    {
                        "id": 149,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-30T12:57:08",
        "updated_on": "2017-07-21T13:16:42",
        "closed_on": "2017-07-21T13:16:42",
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
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-30T12:52:05",
            "updated_on": "2017-08-09T15:04:13",
            "closed_on": "2017-08-09T15:04:13",
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
                "id": 2,
                "name": "Нормальный"
            }
        },
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 7,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-06-30T12:59:47",
                "edited_on": "2017-06-30T12:59:47",
                "details": [
                    {
                        "id": 10,
                        "property": "attr",
                        "prop_key": "parent_id",
                        "old_value": null,
                        "value": "7"
                    }
                ]
            },
            {
                "id": 13,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-07-21T13:16:42",
                "edited_on": "2017-07-21T13:16:42",
                "details": [
                    {
                        "id": 19,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-30T13:48:27",
        "updated_on": "2017-07-21T13:17:08",
        "closed_on": "2017-07-21T13:17:08",
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
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-30T12:52:05",
            "updated_on": "2017-08-09T15:04:13",
            "closed_on": "2017-08-09T15:04:13",
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
                "id": 2,
                "name": "Нормальный"
            }
        },
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 8,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-06-30T13:50:10",
                "edited_on": "2017-06-30T13:50:10",
                "details": []
            },
            {
                "id": 14,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-07-21T13:17:08",
                "edited_on": "2017-07-21T13:17:08",
                "details": [
                    {
                        "id": 20,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-30T14:12:14",
        "updated_on": "2017-07-21T13:16:17",
        "closed_on": "2017-07-21T13:16:17",
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
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-30T12:52:05",
            "updated_on": "2017-08-09T15:04:13",
            "closed_on": "2017-08-09T15:04:13",
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
                "id": 2,
                "name": "Нормальный"
            }
        },
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 9,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-06-30T14:14:04",
                "edited_on": "2017-06-30T14:14:04",
                "details": []
            },
            {
                "id": 10,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-06-30T14:18:13",
                "edited_on": "2017-06-30T14:18:13",
                "details": [
                    {
                        "id": 15,
                        "property": "attr",
                        "prop_key": "parent_id",
                        "old_value": null,
                        "value": "7"
                    }
                ]
            },
            {
                "id": 11,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-06-30T14:20:40",
                "edited_on": "2017-06-30T14:20:40",
                "details": []
            },
            {
                "id": 12,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-07-21T13:16:17",
                "edited_on": "2017-07-21T13:16:17",
                "details": [
                    {
                        "id": 18,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-06-30T14:21:51",
        "updated_on": "2017-07-21T13:18:02",
        "closed_on": "2017-07-21T13:18:02",
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
        },
        "is_private": null,
        "parent": {
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
            "created_on": "2017-06-30T12:52:05",
            "updated_on": "2017-08-09T15:04:13",
            "closed_on": "2017-08-09T15:04:13",
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
                "id": 2,
                "name": "Нормальный"
            }
        },
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 16,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "",
                "created_on": "2017-07-21T13:18:02",
                "edited_on": "2017-07-21T13:18:02",
                "details": [
                    {
                        "id": 22,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-07-04T07:37:37",
        "updated_on": "2017-10-18T19:03:06",
        "closed_on": "2017-08-11T11:38:22",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 27,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "Планируйте до конца месяца.",
                "created_on": "2017-07-26T08:53:42",
                "edited_on": "2017-07-26T08:53:42",
                "details": [
                    {
                        "id": 37,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "4",
                        "value": "11"
                    }
                ]
            },
            {
                "id": 213,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "работа выполнена!",
                "created_on": "2017-08-11T11:38:22",
                "edited_on": "2017-08-11T11:38:22",
                "details": [
                    {
                        "id": 190,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "2",
                        "value": "5"
                    }
                ]
            },
            {
                "id": 3252,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-10-18T19:03:06",
                "edited_on": "2017-10-18T19:03:06",
                "details": [
                    {
                        "id": 3305,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "0",
                        "value": "100"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-07-04T07:58:48",
        "updated_on": "2017-11-07T12:49:40",
        "closed_on": "2017-11-07T12:49:40",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 146,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "и что ?? дальше",
                "created_on": "2017-08-09T15:05:00",
                "edited_on": "2017-08-09T15:05:00",
                "details": []
            },
            {
                "id": 152,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "пока думают над кп.",
                "created_on": "2017-08-09T15:42:11",
                "edited_on": "2017-08-09T15:42:11",
                "details": [
                    {
                        "id": 153,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1677,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "встречался еще раз с курирующими этот вопрос людьми. \r\nрешение положительное, но они еще определяются со всеми своими хотелками..",
                "created_on": "2017-09-18T12:08:17",
                "edited_on": "2017-09-18T12:08:17",
                "details": []
            },
            {
                "id": 4192,
                "user": {
                    "id": 2,
                    "lastname": "Anonymous",
                    "firstname": ""
                },
                "notes": "",
                "created_on": "2017-11-07T12:49:40",
                "edited_on": "2017-11-07T12:49:40",
                "details": [
                    {
                        "id": 4265,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "2",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-07-05T17:42:22",
        "updated_on": "2018-08-15T22:13:04",
        "closed_on": "2017-09-14T11:02:29",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 181,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-10T15:28:25",
                "edited_on": "2017-08-10T15:28:25",
                "details": [
                    {
                        "id": 167,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "3",
                        "value": "4"
                    }
                ]
            },
            {
                "id": 184,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-10T15:56:11",
                "edited_on": "2017-08-10T15:56:11",
                "details": [
                    {
                        "id": 169,
                        "property": "attr",
                        "prop_key": "subject",
                        "old_value": "ФЛ, ул. Цветочная, д.65",
                        "value": "ФЛ, ул.Цветочная, д.65"
                    }
                ]
            },
            {
                "id": 649,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-24T12:09:47",
                "edited_on": "2017-08-24T12:09:47",
                "details": [
                    {
                        "id": 594,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 790,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "сроки неизвестны, аб.информирован",
                "created_on": "2017-08-28T16:42:18",
                "edited_on": "2017-08-28T16:42:18",
                "details": []
            },
            {
                "id": 1289,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-09-11T10:42:09",
                "edited_on": "2017-09-11T10:42:09",
                "details": [
                    {
                        "id": 1143,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "11",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1457,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "техническая возможность отсутствует.",
                "created_on": "2017-09-14T09:12:59",
                "edited_on": "2017-09-14T09:12:59",
                "details": [
                    {
                        "id": 1310,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "6"
                    }
                ]
            },
            {
                "id": 1460,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-09-14T09:26:41",
                "edited_on": "2017-09-14T09:26:41",
                "details": [
                    {
                        "id": 1313,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "6",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1506,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-09-14T11:02:29",
                "edited_on": "2017-09-14T11:02:29",
                "details": [
                    {
                        "id": 1354,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "7",
                        "value": "5"
                    }
                ]
            },
            {
                "id": 22776,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": null,
                "created_on": "2018-08-15T22:13:04",
                "edited_on": "2018-08-15T22:13:04",
                "details": [
                    {
                        "id": 28296,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "56"
                    }
                ]
            }
        ],
        "custom_values": [
            {
                "id": 5,
                "value": "",
                "custom_field": {
                    "id": 2,
                    "name": "Категория абонента"
                }
            },
            {
                "id": 6,
                "value": "",
                "custom_field": {
                    "id": 3,
                    "name": "Тип Подключения"
                }
            },
            {
                "id": 7,
                "value": "",
                "custom_field": {
                    "id": 4,
                    "name": "Адрес подключения"
                }
            },
            {
                "id": 8,
                "value": "",
                "custom_field": {
                    "id": 5,
                    "name": "К/Т - для связи"
                }
            }
        ]
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
        "created_on": "2017-07-07T09:11:49",
        "updated_on": "2017-09-04T14:39:00",
        "closed_on": "2017-09-04T14:39:00",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 226,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "?",
                "created_on": "2017-08-11T16:18:11",
                "edited_on": "2017-08-11T16:18:11",
                "details": []
            },
            {
                "id": 631,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-24T10:47:45",
                "edited_on": "2017-08-24T10:47:45",
                "details": [
                    {
                        "id": 566,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "3",
                        "value": "4"
                    },
                    {
                        "id": 567,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 786,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "провести тех.обследование",
                "created_on": "2017-08-28T16:38:33",
                "edited_on": "2017-08-28T16:38:33",
                "details": [
                    {
                        "id": 716,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "7",
                        "value": "1"
                    },
                    {
                        "id": 717,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "11",
                        "value": "23"
                    }
                ]
            },
            {
                "id": 843,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "29.08.17 Запланирован выезд тех.обследования ",
                "created_on": "2017-08-29T11:46:29",
                "edited_on": "2017-08-29T11:46:29",
                "details": [
                    {
                        "id": 755,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1032,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "тех.возм.нет Н.Бортников), аб.информирован",
                "created_on": "2017-09-04T14:39:00",
                "edited_on": "2017-09-04T14:39:00",
                "details": [
                    {
                        "id": 895,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "2",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-07-07T17:00:07",
        "updated_on": "2020-05-18T13:56:09",
        "closed_on": "2017-09-15T11:47:23",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 635,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-24T10:50:55",
                "edited_on": "2017-08-24T10:50:55",
                "details": [
                    {
                        "id": 572,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "3",
                        "value": "4"
                    },
                    {
                        "id": 573,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 789,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "сроки пока не определены, аб.информирован",
                "created_on": "2017-08-28T16:41:40",
                "edited_on": "2017-08-28T16:41:40",
                "details": []
            },
            {
                "id": 1288,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-09-11T10:41:42",
                "edited_on": "2017-09-11T10:41:42",
                "details": [
                    {
                        "id": 1142,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "11",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1478,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "нет тех возможности. адрес учитывать при анализировании нового сегмента.",
                "created_on": "2017-09-14T09:58:35",
                "edited_on": "2017-09-14T09:58:35",
                "details": [
                    {
                        "id": 1330,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "6"
                    }
                ]
            },
            {
                "id": 1597,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-09-15T11:47:23",
                "edited_on": "2017-09-15T11:47:23",
                "details": [
                    {
                        "id": 1469,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "7",
                        "value": "5"
                    },
                    {
                        "id": 1470,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "6",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 22789,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": null,
                "created_on": "2018-08-15T22:14:23",
                "edited_on": "2018-08-15T22:14:23",
                "details": [
                    {
                        "id": 28309,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "56"
                    }
                ]
            },
            {
                "id": 66714,
                "user": {
                    "id": 65,
                    "lastname": "Зубенко",
                    "firstname": "Александра"
                },
                "notes": "",
                "created_on": "2019-10-09T10:45:56",
                "edited_on": "2019-10-09T10:45:56",
                "details": [
                    {
                        "id": 89264,
                        "property": "relation",
                        "prop_key": "relates",
                        "old_value": null,
                        "value": "15159"
                    }
                ]
            },
            {
                "id": 97167,
                "user": {
                    "id": 50,
                    "lastname": "Кусмачева",
                    "firstname": "Анна"
                },
                "notes": "переключение 3500р\r\nдумает",
                "created_on": "2020-05-18T13:56:09",
                "edited_on": "2020-05-18T13:56:09",
                "details": [
                    {
                        "id": 130236,
                        "property": "attr",
                        "prop_key": "subject",
                        "old_value": "ФЛ, л/сч.2324, 2-й пр.Герцена, д.4",
                        "value": "п.Яблоновский, 2-й пр.Герцена, д.4"
                    },
                    {
                        "id": 130237,
                        "property": "cf",
                        "prop_key": "1",
                        "old_value": "",
                        "value": "Яблоновский"
                    },
                    {
                        "id": 130238,
                        "property": "cf",
                        "prop_key": "2",
                        "old_value": "",
                        "value": "физ.лицо"
                    },
                    {
                        "id": 130239,
                        "property": "cf",
                        "prop_key": "3",
                        "old_value": "",
                        "value": "Оптика - EPON/GPON"
                    },
                    {
                        "id": 130240,
                        "property": "cf",
                        "prop_key": "4",
                        "old_value": "",
                        "value": "2-й пр.Герцена, д.4"
                    },
                    {
                        "id": 130241,
                        "property": "cf",
                        "prop_key": "5",
                        "old_value": "",
                        "value": "89184806083"
                    }
                ]
            },
            {
                "id": 97169,
                "user": {
                    "id": 50,
                    "lastname": "Кусмачева",
                    "firstname": "Анна"
                },
                "notes": "",
                "created_on": "2020-05-18T13:56:18",
                "edited_on": "2020-05-18T13:56:18",
                "details": [
                    {
                        "id": 130243,
                        "property": "relation",
                        "prop_key": "relates",
                        "old_value": "15159",
                        "value": null
                    }
                ]
            }
        ],
        "custom_values": [
            {
                "id": 9,
                "value": "физ.лицо",
                "custom_field": {
                    "id": 2,
                    "name": "Категория абонента"
                }
            },
            {
                "id": 10,
                "value": "Оптика - EPON/GPON",
                "custom_field": {
                    "id": 3,
                    "name": "Тип Подключения"
                }
            },
            {
                "id": 11,
                "value": [
                    "2-й пр.Герцена",
                    "д.4"
                ],
                "custom_field": {
                    "id": 4,
                    "name": "Адрес подключения"
                }
            },
            {
                "id": 12,
                "value": "89184806083",
                "custom_field": {
                    "id": 5,
                    "name": "К/Т - для связи"
                }
            }
        ]
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
        "created_on": "2017-07-10T15:43:27",
        "updated_on": "2018-08-15T22:18:44",
        "closed_on": "2017-09-25T15:37:52",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [
            {
                "id": 529,
                "title": "ФЛ, ул.Промышленная, д.51/2",
                "description": "К.т.: +7 918 343-85-24 Елена.\r\nПрошу проверить наличие тех.возм.",
                "assigned": {
                    "id": 56,
                    "lastname": "Абон.отдел ",
                    "firstname": ""
                },
                "author": {
                    "id": 10,
                    "lastname": "Кравченко",
                    "firstname": "Татьяна"
                },
                "done_ratio": 0,
                "completed_on": null,
                "created_on": "2017-09-18T14:26:45",
                "updated_on": "2018-08-15T22:18:45",
                "closed_on": "2017-09-25T15:38:12",
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
                "id": 1083,
                "title": "ФЛ, ул.Промышленная, д.45/1",
                "description": "К.т.: +79604921751 Александр Михайлович.\r\nРассчитать стоимость необходимого метража для подключения данного адреса(1500 руб. Доп оплата за длину кабеля)",
                "assigned": {
                    "id": 64,
                    "lastname": "Буренин",
                    "firstname": "Дмитрий"
                },
                "author": {
                    "id": 10,
                    "lastname": "Кравченко",
                    "firstname": "Татьяна"
                },
                "done_ratio": 100,
                "completed_on": null,
                "created_on": "2017-10-31T14:21:01",
                "updated_on": "2019-02-21T13:20:54",
                "closed_on": "2019-02-21T13:20:54",
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
            }
        ],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 179,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-10T15:27:06",
                "edited_on": "2017-08-10T15:27:06",
                "details": [
                    {
                        "id": 165,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "1",
                        "value": "4"
                    }
                ]
            },
            {
                "id": 652,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-24T12:11:14",
                "edited_on": "2017-08-24T12:11:14",
                "details": [
                    {
                        "id": 597,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 800,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "сроки пока неизвестны, аб.информирован",
                "created_on": "2017-08-28T16:55:07",
                "edited_on": "2017-08-28T16:55:07",
                "details": []
            },
            {
                "id": 1287,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-09-11T10:41:28",
                "edited_on": "2017-09-11T10:41:28",
                "details": [
                    {
                        "id": 1141,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "11",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1622,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "по промышленной 57. Подключить мы его можем в том случае если будет ещё 3 абонента рядом с ним, тогда будем прокидывать кабель, ставить муфту и только тогда от неё подключать абонентов.\r\nАдреса потенциальных абонентов:\r\nул. промышленная четные номера: с 18 по 30.\r\nул. промышленная не четные номера: с 51 по 65\r\nул. пушкина четные номера:с 2 по 8\r\nул пушкина нечетные номера: с 1 по 9.\r\nпо промышленной 66. Подключить мы его не сможем. он очень далеко находится от нашего сегмента.",
                "created_on": "2017-09-16T08:01:48",
                "edited_on": "2017-09-16T08:01:48",
                "details": [
                    {
                        "id": 1495,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "6"
                    }
                ]
            },
            {
                "id": 1694,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-09-18T15:56:47",
                "edited_on": "2017-09-18T15:56:47",
                "details": [
                    {
                        "id": 1564,
                        "property": "relation",
                        "prop_key": "relates",
                        "old_value": null,
                        "value": "529"
                    }
                ]
            },
            {
                "id": 1786,
                "user": {
                    "id": 10,
                    "lastname": "Кравченко",
                    "firstname": "Татьяна"
                },
                "notes": "Абонент информирован, будет искать желающих.",
                "created_on": "2017-09-20T13:48:07",
                "edited_on": "2017-09-20T13:48:07",
                "details": []
            },
            {
                "id": 1932,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-09-25T14:57:09",
                "edited_on": "2017-09-25T14:57:09",
                "details": [
                    {
                        "id": 1801,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "6",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 1944,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2017-09-25T15:37:52",
                "edited_on": "2017-09-25T15:37:52",
                "details": [
                    {
                        "id": 1813,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "7",
                        "value": "5"
                    }
                ]
            },
            {
                "id": 3955,
                "user": {
                    "id": 10,
                    "lastname": "Кравченко",
                    "firstname": "Татьяна"
                },
                "notes": "",
                "created_on": "2017-10-31T14:23:13",
                "edited_on": "2017-10-31T14:23:13",
                "details": [
                    {
                        "id": 4053,
                        "property": "relation",
                        "prop_key": "relates",
                        "old_value": null,
                        "value": "1083"
                    }
                ]
            },
            {
                "id": 5992,
                "user": {
                    "id": 10,
                    "lastname": "Кравченко",
                    "firstname": "Татьяна"
                },
                "notes": "Абонент недоступен.",
                "created_on": "2017-12-08T09:53:59",
                "edited_on": "2017-12-08T09:53:59",
                "details": []
            },
            {
                "id": 12057,
                "user": {
                    "id": 10,
                    "lastname": "Кравченко",
                    "firstname": "Татьяна"
                },
                "notes": "Снова обращался абонент ждет подключения.",
                "created_on": "2018-04-28T10:01:38",
                "edited_on": "2018-04-28T10:01:38",
                "details": []
            },
            {
                "id": 22873,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": null,
                "created_on": "2018-08-15T22:18:44",
                "edited_on": "2018-08-15T22:18:44",
                "details": [
                    {
                        "id": 28393,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "2",
                        "value": "56"
                    }
                ]
            }
        ],
        "custom_values": [
            {
                "id": 13,
                "value": "",
                "custom_field": {
                    "id": 2,
                    "name": "Категория абонента"
                }
            },
            {
                "id": 14,
                "value": "",
                "custom_field": {
                    "id": 3,
                    "name": "Тип Подключения"
                }
            },
            {
                "id": 15,
                "value": "",
                "custom_field": {
                    "id": 4,
                    "name": "Адрес подключения"
                }
            },
            {
                "id": 16,
                "value": "",
                "custom_field": {
                    "id": 5,
                    "name": "К/Т - для связи"
                }
            }
        ]
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
        "created_on": "2017-07-11T15:08:37",
        "updated_on": "2018-01-03T16:32:19",
        "closed_on": "2017-09-04T15:08:33",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 180,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-10T15:28:06",
                "edited_on": "2017-08-10T15:28:06",
                "details": [
                    {
                        "id": 166,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "3",
                        "value": "4"
                    }
                ]
            },
            {
                "id": 651,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-08-24T12:10:45",
                "edited_on": "2017-08-24T12:10:45",
                "details": [
                    {
                        "id": 596,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "7"
                    }
                ]
            },
            {
                "id": 791,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "сроки подкл.неизвестны, аб.информирован",
                "created_on": "2017-08-28T16:42:59",
                "edited_on": "2017-08-28T16:42:59",
                "details": []
            },
            {
                "id": 1038,
                "user": {
                    "id": 5,
                    "lastname": "Марина",
                    "firstname": "Бабенко"
                },
                "notes": "",
                "created_on": "2017-09-04T15:08:33",
                "edited_on": "2017-09-04T15:08:33",
                "details": [
                    {
                        "id": 905,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "7",
                        "value": "5"
                    }
                ]
            },
            {
                "id": 6802,
                "user": {
                    "id": 11,
                    "lastname": "Бородин",
                    "firstname": "Василий"
                },
                "notes": "",
                "created_on": "2018-01-03T16:32:19",
                "edited_on": "2018-01-03T16:32:19",
                "details": [
                    {
                        "id": 7253,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "0",
                        "value": "100"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-07-22T11:36:18",
        "updated_on": "2017-08-06T16:01:55",
        "closed_on": "2017-08-06T16:01:55",
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
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 57,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "Маршрутизатор для Бжегокайской настроен.",
                "created_on": "2017-08-03T23:32:08",
                "edited_on": "2017-08-03T23:32:08",
                "details": [
                    {
                        "id": 70,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "0",
                        "value": "40"
                    }
                ]
            },
            {
                "id": 59,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "На дорожной agg2 нет свободных портов в агрегации!!",
                "created_on": "2017-08-03T23:49:02",
                "edited_on": "2017-08-03T23:49:02",
                "details": [
                    {
                        "id": 72,
                        "property": "attr",
                        "prop_key": "assigned_to_id",
                        "old_value": "12",
                        "value": "13"
                    }
                ]
            },
            {
                "id": 61,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "на дорожной 214/1 ?\r\n\r\nна Бжегокайская ставьте сразу РРЛ резервную.  ориентировочно на вторник. мехруку вызовем, если надо. ответная сторона на нов. АГГ на Солнечной 3й очереди",
                "created_on": "2017-08-04T00:13:05",
                "edited_on": "2017-08-04T00:13:05",
                "details": []
            },
            {
                "id": 70,
                "user": {
                    "id": 13,
                    "lastname": "Туманов",
                    "firstname": "Дмитрий"
                },
                "notes": "сегодня поставил на Бжегокайской,на дорожной пока переносится на след неделю. Ориентировочно в чт.",
                "created_on": "2017-08-04T13:01:36",
                "edited_on": "2017-08-04T13:01:36",
                "details": []
            },
            {
                "id": 76,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "Микротик на бжегокайской запустили, OSPF работает, добавили в какти и вочер.\r\nВ течение следующей недели плавно пересадим абонентов.\r\nДля РРЛ и резерва отдельную заявку надо.",
                "created_on": "2017-08-04T15:10:12",
                "edited_on": "2017-08-04T15:10:12",
                "details": [
                    {
                        "id": 81,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "40",
                        "value": "50"
                    }
                ]
            },
            {
                "id": 82,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "Бжегокайская готова.\r\nНа дорожной нет свободный портов.",
                "created_on": "2017-08-06T16:01:55",
                "edited_on": "2017-08-06T16:01:55",
                "details": [
                    {
                        "id": 86,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-07-23T09:38:23",
        "updated_on": "2017-07-24T15:38:08",
        "closed_on": "2017-07-24T15:38:08",
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
            "id": 2,
            "name": "Нормальный"
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 19,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "",
                "created_on": "2017-07-23T09:38:39",
                "edited_on": "2017-07-23T09:38:39",
                "details": [
                    {
                        "id": 25,
                        "property": "attr",
                        "prop_key": "tracker_id",
                        "old_value": "1",
                        "value": "2"
                    }
                ]
            },
            {
                "id": 24,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "Сервер готов.\r\nАдрес 10.40.0.25\r\nвеб-интерфейс http://10.40.0.25/\r\nЛогин server\r\nПароль SXU\r\n\r\nПока что туда сыпятся логи только с микротиков и аггрегаций.",
                "created_on": "2017-07-24T15:38:08",
                "edited_on": "2017-07-24T15:38:08",
                "details": [
                    {
                        "id": 32,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    },
                    {
                        "id": 33,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "0",
                        "value": "100"
                    }
                ]
            }
        ],
        "custom_values": []
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
        "created_on": "2017-07-23T09:42:13",
        "updated_on": "2017-08-12T14:29:55",
        "closed_on": "2017-08-12T14:29:55",
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
            "id": 2,
            "name": "Нормальный"
        },
        "is_private": null,
        "parent": null,
        "children": [],
        "relations": [],
        "members": [],
        "attachments": [],
        "journals": [
            {
                "id": 147,
                "user": {
                    "id": 1,
                    "lastname": "Admin",
                    "firstname": "Redmine"
                },
                "notes": "срок??",
                "created_on": "2017-08-09T15:05:36",
                "edited_on": "2017-08-09T15:05:36",
                "details": []
            },
            {
                "id": 221,
                "user": {
                    "id": 4,
                    "lastname": "Кушу",
                    "firstname": "Аслан"
                },
                "notes": "выполнил?",
                "created_on": "2017-08-11T16:13:37",
                "edited_on": "2017-08-11T16:13:37",
                "details": []
            },
            {
                "id": 243,
                "user": {
                    "id": 12,
                    "lastname": "Корепов",
                    "firstname": "Евгений"
                },
                "notes": "Сам сервер готов, но выключен, мы пока не можем на него переехать, потому что используется старый и все оборудование настроено на старый. Надо будет все оборудование перенастраивать.\r\nДа и острой необходимости пока что нет. ",
                "created_on": "2017-08-12T14:29:55",
                "edited_on": "2017-08-12T14:29:55",
                "details": [
                    {
                        "id": 208,
                        "property": "attr",
                        "prop_key": "status_id",
                        "old_value": "1",
                        "value": "5"
                    },
                    {
                        "id": 209,
                        "property": "attr",
                        "prop_key": "done_ratio",
                        "old_value": "0",
                        "value": "50"
                    }
                ]
            }
        ],
        "custom_values": []
    }
]''';

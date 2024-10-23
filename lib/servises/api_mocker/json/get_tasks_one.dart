const getTasksOne = r'''{
    "id": 1,
    "title": "Тестирование Redmine Проводов.нет",
    "description": "Тестируем пишем что надо добавить, что убрать.",
    "assigned": {
        "id": 1,
        "lastname": "Admin",
        "firstname": "Redmine"
    },
    "author": {
        "id": 5,
        "lastname": "Admin",
        "firstname": "Redmine"
    },
    "done_ratio": 0,
    "completed_on": null,
    "created_on": "2017-06-22T16:05:59",
    "updated_on": "2023-10-21T09:30:34.028733",
    "closed_on": "2017-08-09T13:54:41",
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
                "id": 5,
                "lastname": "Admin",
                "firstname": "Redmine"
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
                "id": 5,
                "lastname": "Admin",
                "firstname": "Redmine"
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
                "id": 5,
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
                "id": 5,
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
                "id": 5,
                "lastname": "Admin",
                "firstname": "Redmine"
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
                "id": 5,
                "lastname": "Admin",
                "firstname": "Redmine"
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
    "members": [
        {
            "id": 9,
            "lastname": "Руководители",
            "firstname": ""
        },
        {
            "id": 11,
            "lastname": "Бородин",
            "firstname": "Василий"
        }
    ],
    "attachments": [
        {
            "id": 7,
            "filename": "1.zip",
            "disk_filename": "1____21 10:19:28.jpg",
            "filesize": 280787,
            "content_type": "zip",
            "author": {
                "id": 189,
                "lastname": "admin",
                "firstname": "test"
            },
            "created_on": "2023-10-21T10:17:43.055272",
            "disk_directory": "2023/10"
        },
        {
            "id": 9,
            "filename": "not_loaded_image.jpg",
            "disk_filename": "0002____21 10:35:01.jpg",
            "filesize": 189101,
            "content_type": "image/jpeg",
            "author": {
                "id": 189,
                "lastname": "admin",
                "firstname": "test"
            },
            "created_on": "2023-10-21T10:17:43.055272",
            "disk_directory": "2023/10"
        },
        {
            "id": 10,
            "filename": "2.jpg",
            "disk_filename": "2____21 10:43:13.jpg",
            "filesize": 189101,
            "content_type": "image/jpeg",
            "author": {
                "id": 189,
                "lastname": "admin",
                "firstname": "test"
            },
            "created_on": "2023-10-21T10:17:43.055272",
            "disk_directory": "2023/10"
        }
    ],
    "journals": [
        {
            "id": 1,
            "user": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "notes": "Тут коммент к этуму действию",
            "created_on": "2018-06-25T16:17:03",
            "edited_on": "2018-06-25T16:17:03",
            "details": [
                {
                    "id": 1,
                    "property": "attr",
                    "prop_key": "priority_id",
                    "old_value": "2",
                    "value": "3"
                }
            ]
        },
        {
            "id": 2,
            "user": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "notes": "",
            "created_on": "2019-06-21T17:30:25",
            "edited_on": "2019-06-21T17:30:25",
            "details": [
                {
                    "id": 2,
                    "property": "attr",
                    "prop_key": "priority_id",
                    "old_value": "3",
                    "value": "2"
                }
            ]
        },
        {
            "id": 53,
            "user": {
                "id": 17,
                "lastname": "support",
                "firstname": "support"
            },
            "notes": "",
            "created_on": "2019-05-03T12:18:59",
            "edited_on": "2019-05-03T12:18:59",
            "details": [
                {
                    "id": 67,
                    "property": "attr",
                    "prop_key": "status_id",
                    "old_value": "1",
                    "value": "5"
                }
            ]
        },
        {
            "id": 554472,
            "user": {
                "id": 1,
                "lastname": "Admin",
                "firstname": "Redmine"
            },
            "notes": "Ту что-нибудь для тестирования",
            "created_on": "2015-03-22T16:17:03",
            "edited_on": "2015-03-22T16:17:03",
            "details": []
        },
        {
            "id": 54,
            "user": {
                "id": 17,
                "lastname": "support",
                "firstname": "support"
            },
            "notes": "",
            "created_on": "2012-08-03T12:19:16",
            "edited_on": "2012-08-03T12:19:16",
            "details": [
                {
                    "id": 68,
                    "property": "attr",
                    "prop_key": "status_id",
                    "old_value": "5",
                    "value": "1"
                }
            ]
        },
        {
            "id": 144,
            "user": {
                "id": 12,
                "lastname": "Корепов",
                "firstname": "Евгений"
            },
            "notes": "",
            "created_on": "2013-08-09T13:54:41",
            "edited_on": "2013-08-09T13:54:41",
            "details": [
                {
                    "id": 148,
                    "property": "attr",
                    "prop_key": "status_id",
                    "old_value": "1",
                    "value": "5"
                }
            ]
        },
        {
            "id": 359211,
            "user": {
                "id": 189,
                "lastname": "admin",
                "firstname": "test"
            },
            "notes": null,
            "created_on": "2022-10-20T18:47:08.178205",
            "edited_on": null,
            "details": [
                {
                    "id": 442503,
                    "property": "members",
                    "prop_key": null,
                    "old_value": "",
                    "value": "9"
                }
            ]
        },
        {
            "id": 359212,
            "user": {
                "id": 189,
                "lastname": "admin",
                "firstname": "test"
            },
            "notes": null,
            "created_on": "2021-10-20T18:47:08.178205",
            "edited_on": null,
            "details": [
                {
                    "id": 442504,
                    "property": "members",
                    "prop_key": null,
                    "old_value": "9",
                    "value": "9,11"
                }
            ]
        },
        {
            "id": 359213,
            "user": {
                "id": 189,
                "lastname": "admin",
                "firstname": "test"
            },
            "notes": null,
            "created_on": "2023-10-20T18:47:08.178205",
            "edited_on": null,
            "details": [
                {
                    "id": 442505,
                    "property": "members",
                    "prop_key": null,
                    "old_value": "9,11",
                    "value": "9,11,12"
                }
            ]
        },
        {
            "id": 359214,
            "user": {
                "id": 189,
                "lastname": "admin",
                "firstname": "test"
            },
            "notes": null,
            "created_on": "2020-10-20T18:47:08.178205",
            "edited_on": null,
            "details": [
                {
                    "id": 442506,
                    "property": "members",
                    "prop_key": null,
                    "old_value": "9,11,12",
                    "value": "9,11"
                }
            ]
        }
    ],
    "custom_values": [
        {
            "id": 1,
            "value": "5434545435",
            "custom_field": {
                "id": 12,
                "name": "Лицевой счет",
                "possible_values": null,
                "default_value": ""
            }
        },
        {
            "id": 2,
            "value": "Телевидение",
            "custom_field": {
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
            }
        }
    ]
}''';

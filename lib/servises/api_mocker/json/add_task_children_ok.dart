const addTaskChildrenOk = r'''[
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
    ]''';
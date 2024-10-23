const createTaskOk = '''{
    "error": false,
    "error_message": "",
    "current_user": {
        "id": 189,
        "name": {
            "lastname": "admin",
            "firstname": "test"
        },
        "projects": [
            {
                "id": 1,
                "name": "Проводов.нет"
            },
            {
                "id": 2,
                "name": "Проводов.Нет - Руководство"
            }
        ],
        "status": true,
        "is_admin": null,
        "groups": [
            {
                "id": 7,
                "name": "Тех.поддержка"
            }
        ]
    },
    "method": "create_task",
    "data": {
        "id": 2,
        "is_private": 0,
        "title": "Задача тестовая 1",
        "image_data": null,
        "tracker": "Тех.Поддержка",
        "status": "Новая",
        "priority": "Низкая",
        "assigned": "admin test",
        "description": "Ну тут должно быть длиннное описание этой тестовой задачи",
        "created": {
            "user_name": "admin test",
            "user_id": 189
        },
        "parent": null,
        "complete": 0,
        "date_created": 1696449456,
        "date_edited": null,
        "date_completed": null,
        "date_closed": null,
        "total_members": 3,
        "members": [
            {
                "number": 0,
                "id": 189,
                "name": "admin test"
            },
            {
                "number": 1,
                "id": 1,
                "name": "Admin Redmine"
            },
            {
                "number": 2,
                "id": 13,
                "name": "Туманов Дмитрий"
            }
        ],
        "total_attachments": null,
        "attachments": [],
        "total_custom_fields": null,
        "custom_fields": [],
        "total_actions": null,
        "actions": [],
        "total_relations": null,
        "relations": null,
        "total_relations_by_ls": null,
        "relations_by_ls": []
    }
}''';
List<Map<String, String>> getMenu(String title) {
  switch (title) {
    case 'Новости':
      return [];
    case 'Склад':
      return [
        {'name': 'Формы', 'path': '/forms', 'parent': '/storehouse'},
        {'name': 'Настройки', 'path': '/settings', 'parent': '/storehouse'},
        {'name': 'Операции', 'path': '/operations', 'parent': '/storehouse'},
      ];
    case 'Остатки':
      return [
        {'name': 'На складах', 'path': '/instoreroom', 'parent': '/balance'},
        {'name': 'В резерве', 'path': '/reserves', 'parent': '/balance'},
        {'name': 'Закупки', 'path': '/procurement', 'parent': '/balance'},
      ];
    case 'Справочник':
      return [
        {
          'name': 'Организации',
          'path': '/organizations',
          'parent': '/handbook'
        },
        {'name': 'Сотрудники', 'path': '/users', 'parent': '/handbook'},
      ];
    case 'Поиск':
      return [
        {'name': 'По заявке', 'path': '/bid', 'parent': '/find'},
        {'name': 'По объектам', 'path': '/objects', 'parent': '/find'},
        {'name': 'По серийному номеру', 'path': '/serial', 'parent': '/find'},
      ];
    case 'Для Артема':
      return [
        {'name': 'Бухты кабеля', 'path': '/cable', 'parent': '/artem'},
        {'name': 'Оприходывание', 'path': '/arrival', 'parent': '/artem'},
      ];
    case 'Добавить':
      return [
        {'name': 'Материал', 'path': '/', 'parent': '/add'},
        {'name': 'Кабель', 'path': '/', 'parent': '/add'},
        {'name': 'Оборудование', 'path': '/', 'parent': '/add'},
      ];
    default:
      return [];
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/side_bar/helpers/menu_helper.dart';
import 'package:pronet_storeroom_v_01/widgets/menu_button_widget.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/side_bar/widgets/side_bar_button_widget.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  SideBarState createState() => SideBarState();
}

class SideBarState extends State<SideBar> {
  String _hoveredButton = '';

  void _onEnter(String button) {
    setState(() {
      _hoveredButton = button;
    });
  }

  void _onExit() {
    setState(() {
      _hoveredButton = '';
    });
  }

  void _onTap(String route, String parent, String title) {
    context.go(parent + route);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, String>> buttons = getMenu(_hoveredButton);
    return Positioned(
      top: 15,
      left: 10,
      child: MouseRegion(
        onExit: (_) => _onExit(),
        child: SizedBox(
          width: _hoveredButton.isNotEmpty ? 400 : 100,
          height: 820,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: MouseRegion(
                      onEnter: (_) => _onEnter('Добавить'),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          iconColor:
                              const MaterialStatePropertyAll(greyBlue45Color),
                          backgroundColor:
                              const MaterialStatePropertyAll(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SidebarButtonWidget(
                    name: "Новости",
                    parent: '/news',
                    route: '/',
                    icon: Icons.newspaper_outlined,
                    selectedIcon: Icons.newspaper,
                    onTap: _onTap,
                    onEnter: _onEnter,
                  ),
                  SidebarButtonWidget(
                    name: "Склад",
                    parent: '/storehouse',
                    route: '/forms',
                    icon: Icons.warehouse_outlined,
                    selectedIcon: Icons.warehouse,
                    onTap: _onTap,
                    onEnter: _onEnter,
                  ),
                  SidebarButtonWidget(
                    name: "Остатки",
                    parent: '/balance',
                    route: '/instoreroom',
                    icon: Icons.layers_outlined,
                    selectedIcon: Icons.layers,
                    onTap: _onTap,
                    onEnter: _onEnter,
                  ),
                  SidebarButtonWidget(
                    name: "Справочник",
                    parent: '/handbook',
                    route: '/organizations',
                    icon: Symbols.book_4,
                    selectedIcon: Symbols.book_4_sharp,
                    onTap: _onTap,
                    onEnter: _onEnter,
                  ),
                  SidebarButtonWidget(
                    name: "Поиск",
                    parent: '/find',
                    route: '/bid',
                    icon: Icons.search,
                    selectedIcon: Icons.search,
                    onTap: _onTap,
                    onEnter: _onEnter,
                  ),
                  SidebarButtonWidget(
                    name: "Для Артема",
                    parent: '/artem',
                    route: '/cable',
                    icon: Symbols.other_admission,
                    selectedIcon: Symbols.other_admission,
                    onTap: _onTap,
                    onEnter: _onEnter,
                  ),
                  SidebarButtonWidget(
                    name: "Тест",
                    parent: '/test',
                    route: '/',
                    icon: Icons.assignment_outlined,
                    selectedIcon: Icons.assignment,
                    onTap: _onTap,
                    onEnter: _onEnter,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
              if (_hoveredButton.isNotEmpty && _hoveredButton != 'Новости')
                Positioned(
                  top: 0,
                  left: 80,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                      color: backgroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(17, 0, 0, 0),
                          blurRadius: 15,
                          offset: Offset(10, 0),
                        ),
                      ],
                    ),
                    width: 280.0,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 0),
                          child: Text(
                            _hoveredButton,
                            style: theme.textTheme.displayMedium,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: greyBlueColor93,
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: ListView(
                            key: ValueKey<String>(_hoveredButton),
                            children: buttons
                                .map((button) => MenuButtonWidget(
                                      name: button['name'] ?? '',
                                      path: button['path'] ?? '',
                                      parent: button['parent'] ?? '',
                                    ))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

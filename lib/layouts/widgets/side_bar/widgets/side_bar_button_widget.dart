import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';

class SidebarButtonWidget extends StatefulWidget {
  final String name;
  final String route;
  final String parent;
  final IconData icon;
  final IconData selectedIcon;
  final Function(String, String, String) onTap;
  final Function(String) onEnter;

  const SidebarButtonWidget({
    Key? key,
    required this.name,
    required this.parent,
    required this.route,
    required this.icon,
    required this.selectedIcon,
    required this.onTap,
    required this.onEnter,
  }) : super(key: key);

  @override
  SidebarButtonWidgetState createState() => SidebarButtonWidgetState();
}

class SidebarButtonWidgetState extends State<SidebarButtonWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentRoute = GoRouterState.of(context).matchedLocation;
    final bool isActive = currentRoute.startsWith(widget.parent);

    return InkWell(
      onTap: () => widget.onTap(widget.route, widget.parent, widget.name),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
          widget.onEnter(widget.name);
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: _isHovered
                      ? hoverColors2 // Цвет фона при наведении
                      : (isActive ? whiteColor : transparent),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Icon(
                  isActive ? widget.selectedIcon : widget.icon,
                  color: greyBlue45Color,
                ),
              ),
              Text(
                widget.name,
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:pronet_storeroom_v_01/themes/theme.dart';
import 'package:flutter/material.dart';

class GlobalSearch extends StatelessWidget {
  const GlobalSearch({
    super.key,
    this.menuCloseHandler,
  });

  final Function? menuCloseHandler;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth > 1440 ? 400 : 300,
      height: 40,
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          hintText: 'Найти',
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            return const Color.fromARGB(255, 255, 255, 255);
          }),
          hintStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, color: Color(0xff7d8fb3))),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)))),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          onTap: () {
            // controller.openView();
          },
          onChanged: (_) {
            // controller.openView();
          },
          onSubmitted: (value) {
            // context.router.navigate(
            //     TaskListRoute(forMe: false, iniSearchText: controller.text));
            // controller.text = '';
            // if (menuCloseHandler != null) {
            //   menuCloseHandler!();
            // }
          },
          leading: const Icon(
            Icons.search,
            size: 16,
            color: greyBlue45Color,
          ),
        );
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(0, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {},
          );
        });
      }),
    );
  }
}

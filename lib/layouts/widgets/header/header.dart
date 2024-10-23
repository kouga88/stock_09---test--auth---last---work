import 'package:pronet_storeroom_v_01/layouts/widgets/header/header_emoloye_info.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/header_logout.dart';
import 'package:pronet_storeroom_v_01/themes/theme.dart';
import 'package:pronet_storeroom_v_01/layouts/widgets/global_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Full width of the screen
      padding: const EdgeInsets.all(20.0),
      color: backgroundColor, // You can change the color as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              IconButton(
                style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(50, 50)),
                    iconSize: MaterialStatePropertyAll(24),
                    backgroundColor: MaterialStatePropertyAll(transparent)),
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              const SizedBox(
                width: 40,
              ),
              InkWell(
                onTap: () => context.go('/news'),
                child: Image.asset(
                  "images/logo.png",
                  width: 150,
                ),
              ),
            ],
          ),
          const GlobalSearch(),
          Row(
            children: [
              HeaderEmolyeInfo(
                withRoles: false,
              ),
              const SizedBox(
                width: 40,
              ),
              IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.apps),
              ),
              const SizedBox(
                width: 10,
              ),
              HeaderLogout(),
            ],
          )
        ],
      ),
    );
  }
}

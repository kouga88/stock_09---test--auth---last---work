import 'package:flutter/material.dart';

// class EquipmentPage extends StatelessWidget {
//   const EquipmentPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('Настройки инструментов'),
//     );
//   }
// }

class EquipmentPage extends StatefulWidget {
  const EquipmentPage({super.key});

  @override
  State<EquipmentPage> createState() => _EquipmentPageState();
}

class _EquipmentPageState extends State<EquipmentPage> {
  @override
  Widget build(BuildContext context) {
    return const Text('Настройки инструментов');
  }
}

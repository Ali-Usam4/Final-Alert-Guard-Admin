import 'package:flutter/material.dart';

import '../../../ui/widgets/base_scaffold.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: Center(child: Text("Users")));
  }
}

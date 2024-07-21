import 'package:final_alert_guard_admin/ui/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: Center(child: Text("Dashboard")));
  }
}

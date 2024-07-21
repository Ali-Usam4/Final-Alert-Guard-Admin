import 'package:final_alert_guard_admin/utils/extensions/extended_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String numbers;
  final Color color;
  final Color darkColor;
  final VoidCallback onAddTap;
  final VoidCallback onViewTap;

  const CardWidget(
      {super.key,
      required this.title,
      required this.numbers,
      required this.onAddTap,
      required this.onViewTap,
      required this.color,
      required this.darkColor});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 220,
      width: width * 0.13,
      child: Card(
        color: color,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: context.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SvgPicture.asset('assets/icons/ic_more.svg'),
                ],
              ),
              Text(
                numbers,
                style: context.textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/ic_add.svg',
                      ),
                    ),
                    padding: EdgeInsets.zero,
                    hoverColor: Colors.transparent,
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () {},
                      icon: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: darkColor,
                        ),
                        child: Text(
                          'View All',
                          style: context.textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.zero,
                      hoverColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

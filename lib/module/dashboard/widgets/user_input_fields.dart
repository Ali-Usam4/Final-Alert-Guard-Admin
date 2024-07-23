import 'package:flutter/material.dart';

import '../../../ui/input/input_field.dart';
import '../../../utils/validators/validators.dart';

class UserInputFields extends StatelessWidget {
  const UserInputFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InputField(
                controller: TextEditingController(),
                label: 'Name',
                title: 'User Name',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: InputField(
                controller: TextEditingController(),
                label: 'Phone',
                title: 'Phone',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InputField(
                controller: TextEditingController(),
                label: 'Address',
                title: 'Address',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: InputField(
                controller: TextEditingController(),
                label: 'City',
                title: 'City',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InputField(
                controller: TextEditingController(),
                label: 'State',
                title: 'State',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: InputField(
                controller: TextEditingController(),
                label: 'State',
                title: 'State',
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

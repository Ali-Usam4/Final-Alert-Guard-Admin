import 'package:flutter/material.dart';

import '../../../ui/input/input_field.dart';
import '../../../utils/validators/validators.dart';

class UserInputFields extends StatelessWidget {
  final TextEditingController userNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  const UserInputFields(
      {super.key,
      required this.userNameController,
      required this.phoneNumberController,
      required this.addressController,
      required this.cityController,
      required this.stateController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InputField(
                controller: userNameController,
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
                controller: phoneNumberController,
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
                controller: addressController,
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
                controller: cityController,
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
                controller: stateController,
                label: 'State',
                title: 'State',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            // Expanded(
            //   child: InputField(
            //     controller: TextEditingController(),
            //     label: 'State',
            //     title: 'State',
            //     textInputAction: TextInputAction.next,
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}

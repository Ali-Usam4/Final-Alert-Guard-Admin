import 'package:flutter/material.dart';

import '../../../ui/input/input_field.dart';
import '../../../utils/validators/validators.dart';

class CompanyInputFields extends StatelessWidget {
  final TextEditingController companyNameController;
  final TextEditingController managerNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController stateController;
  final TextEditingController additionalInfoController;

  const CompanyInputFields({
    super.key,
    required this.companyNameController,
    required this.managerNameController,
    required this.phoneNumberController,
    required this.addressController,
    required this.cityController,
    required this.stateController,
    required this.additionalInfoController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InputField(
                controller: companyNameController,
                label: 'Company',
                title: 'Company Name',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: InputField(
                controller: managerNameController,
                label: 'Name',
                title: 'Manager Name',
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
                controller: phoneNumberController,
                label: 'Phone',
                title: 'Phone',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: InputField(
                controller: addressController,
                label: 'Address',
                title: 'Address',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: InputField(
                controller: cityController,
                label: 'City',
                title: 'City',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Expanded(
              child: InputField(
                controller: stateController,
                label: 'State',
                title: 'State',
                textInputAction: TextInputAction.next,
                validator: (value) => Validators.required(value),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        InputField(
          controller: additionalInfoController,
          label: 'Type here',
          title: 'Additional Note',
          isRequired: false,
          textInputAction: TextInputAction.next,
          maxLines: 2,
        ),
      ],
    );
  }
}

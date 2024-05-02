import 'package:flutter/material.dart';
import 'package:vynn/features/shared/widgets/app_text_form_field.dart';

class AppTextFields extends StatelessWidget {
  const AppTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Text Fields'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: const [
          AppTextFormField(
            hintText: 'email@xyz.com',
            prefixIcon: Icons.email_outlined,
            labelText: 'Email address',
          ),
          SizedBox(height: 24),
          AppTextFormField(
            hintText: 'Your secure password',
            prefixIcon: Icons.lock_outline,
            labelText: 'Your password',
          ),
        ],
      ),
    );
  }
}

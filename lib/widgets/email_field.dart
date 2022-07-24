import 'package:flutter/material.dart';
import 'package:mercury/extentions/email_validation.dart';
import 'package:mercury/localization/localization.dart';

class EmailField extends StatelessWidget {
  const EmailField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).textTheme.bodyText1!.color!,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).textTheme.bodyText1!.color!,
          ),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).textTheme.bodyText1!.color!,
        ),
        labelText: AppLocalizations.of(context).loginScreen.email,
      ),
      validator: (input) {
        if (input != null) {
          return input.isValidEmail() ? null : AppLocalizations.of(context).loginScreen.validEmailRequired;
        }
        return null;
      },
    );
  }
}

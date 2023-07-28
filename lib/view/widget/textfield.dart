import 'package:flutter/material.dart';
import '../../utilites/theme/app_theme.dart';

class Trans_TextField extends StatelessWidget {
  Trans_TextField({Key? key , required this.controller,required this.icon,required this.label,required this.type,required this.validation
  }) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String label;
  final TextInputType type;
  Function validation;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validation(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide:  const BorderSide(color: AppTheme.success900, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppTheme.success900, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color:AppTheme.success900, width: 0.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppTheme.success900, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppTheme.success900, width: 0.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppTheme.success900, width: 0.5),
        ),
        prefixIcon: Icon(icon as IconData?, color: AppTheme.success900, size: 20.0,),
        labelText:label,
        labelStyle: const TextStyle(
            color:AppTheme.success700, fontSize: 15.0, fontWeight: FontWeight.bold),

      ),
      keyboardType: type,
      textInputAction: TextInputAction.done,
      controller: controller,
       );

  }
}

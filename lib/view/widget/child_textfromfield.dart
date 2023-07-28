import 'package:flutter/material.dart';
import '../../utilites/theme/app_theme.dart';
import '../../view_controller/cubits/child_cubit/child_cubit.dart';



class ChildTextField extends StatefulWidget {
  ChildTextField({Key? key,required this.controller,required this.icon,required this.label,required this.type,required this.validation
    ,required this.childCubitPass}) : super(key: key);

  final TextEditingController controller;
  final IconData icon;
  final String label;
  final TextInputType type;
  Function validation;
  ChildCubit childCubitPass ;

  @override
  State<ChildTextField> createState() => _ChildTextFieldState();
}

class _ChildTextFieldState extends State<ChildTextField> {
  bool? visablity;

  @override
  Widget build(BuildContext context) {
    // RegisterCubit registerCubit = RegisterCubit.get(context);
    return TextFormField(
      validator: (value) => widget.validation(value),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppTheme.success900, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppTheme.success900, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: AppTheme.success900, width: 0.5),
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
        prefixIcon: Icon(
          widget.icon as IconData?, color: AppTheme.success900, size: 20.0,),
        labelText: widget.label,
        labelStyle: const TextStyle(
            color: AppTheme.success700,
            fontSize: 15.0,
            fontWeight: FontWeight.bold),
        suffixIcon: widget.label == 'Password' ? IconButton(
          icon: const Icon(Icons.visibility_off),
          color: AppTheme.success900,
          iconSize: 20.0,
          onPressed: () {
            widget.childCubitPass.childChangePasswordVisibility();
          },
        ) : widget.label == 'Confirm Password' ? IconButton(
          icon: const Icon(Icons.visibility_off),
          color: AppTheme.success900,
          iconSize: 20.0,
          onPressed: () {
            widget.childCubitPass.childChangeConfirmPasswordVisibility();
          },
        ) : null,
      ),
      keyboardType: widget.type,
      textInputAction: TextInputAction.done,
      controller: widget.controller,
      obscureText: widget.label == 'Password' ? widget.childCubitPass
          .childVisiblePassword :
      widget.label == 'Confirm Password' ? widget.childCubitPass
          .childConfirmPassword : false,
    );
  }

}

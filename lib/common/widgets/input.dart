import 'package:as_pmr/common/constants.dart';
import 'package:as_pmr/common/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppInputManager extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final focusNode = FocusNode();
  final VoidCallback? onSubmitted;
  String? errorText;

  AppInputManager({this.onSubmitted});

  void setError(String errorText) {
    this.errorText = errorText;
    notifyListeners();
  }

  void resetError() {
    errorText = null;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    controller.dispose();
  }
}

class AppInput extends StatefulWidget {
  final String? label;
  final AppInputManager? manager;
  final FormFieldValidator<String>? validator;
  final AppInputManager? nextInputManager;
  final bool isPassword;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextAlign textAlign;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? prefixText;
  final String? suffixText;
  final String? helperText;

  const AppInput({
    super.key,
    this.label,
    this.manager,
    this.validator,
    this.nextInputManager,
    this.isPassword = false,
    this.autofocus = false,
    this.keyboardType,
    this.textAlign = TextAlign.start,
    this.errorText,
    this.inputFormatters,
    this.maxLength,
    this.prefixText,
    this.suffixText,
    this.helperText,
  });

  @override
  State<StatefulWidget> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool _validationEnabled = false;
  bool _passwordHidden = true;
  String? _errorText;

  void _setPasswordVisible(bool visible) {
    setState(() {
      _passwordHidden = !visible;
    });
  }

  @override
  void initState() {
    if (widget.manager != null) {
      widget.manager!.focusNode.addListener(() {
        if (widget.manager!.focusNode.hasFocus == false) {
          setState(() {
            _validationEnabled = true;
          });
        }
      });
      widget.manager!.addListener(() {
        Future.delayed(Duration.zero, () async {
          setState(() {
            _errorText = widget.manager!.errorText;
          });
        });
      });
      if (widget.autofocus) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          Future.delayed(Duration(milliseconds: 300), () async {
            widget.manager!.focusNode.requestFocus();
          });
        });
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool isErrorTextNotEmpty = (_errorText ?? widget.errorText) != null;

    return Material(
      color: AppColors.transparent,
      child: TextFormField(
        controller: widget.manager?.controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          prefixText: widget.prefixText,
          helperText: isErrorTextNotEmpty ? null : widget.helperText,
          suffixText: widget.suffixText,
          contentPadding: EdgeInsets.symmetric(
            vertical: Constants.getFigmaSize(context, 17),
            horizontal: Constants.getFigmaSize(context, 20),
          ),
          errorText: _errorText ?? widget.errorText,
          errorMaxLines: 3,
          labelText: widget.label,
          focusColor: AppColors.black,
          counterText: '',
        ),
        keyboardType: widget.keyboardType,
        textInputAction: widget.nextInputManager == null ? TextInputAction.done : TextInputAction.next,
        validator: widget.validator,
        autovalidateMode: _validationEnabled ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        obscureText: widget.isPassword && _passwordHidden,
        enableSuggestions: !widget.isPassword,
        autocorrect: !widget.isPassword,
        textAlign: widget.textAlign,
        maxLength: widget.maxLength,
        onEditingComplete: () {
          setState(() {
            _validationEnabled = true;
          });
          if (widget.nextInputManager != null) {
            widget.nextInputManager?.focusNode.requestFocus();
          } else {
            FocusManager.instance.primaryFocus?.unfocus();
            if (widget.manager?.onSubmitted != null) {
              widget.manager!.onSubmitted!();
            }
          }
        },
        inputFormatters: widget.inputFormatters,
        focusNode: widget.manager?.focusNode,
      ),
    );
  }
}

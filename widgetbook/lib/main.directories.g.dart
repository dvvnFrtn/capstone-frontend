// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _i1;
import 'package:widgetbook_workspace/auth_screen.dart' as _i6;
import 'package:widgetbook_workspace/button_widget.dart' as _i2;
import 'package:widgetbook_workspace/dropdown_widget.dart' as _i3;
import 'package:widgetbook_workspace/otp_screen.dart' as _i5;
import 'package:widgetbook_workspace/textfield_widget.dart' as _i4;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'presentation',
    children: [
      _i1.WidgetbookFolder(
        name: 'components',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'XButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.defaultButtonUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'XDropDown',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.defaultDropDownUseCase,
            ),
          ),
          _i1.WidgetbookComponent(
            name: 'XTextField',
            useCases: [
              _i1.WidgetbookUseCase(
                name: 'Default',
                builder: _i4.defaultTextFieldUseCase,
              ),
              _i1.WidgetbookUseCase(
                name: 'Number',
                builder: _i4.numberTextFieldUseCase,
              ),
            ],
          ),
        ],
      ),
      _i1.WidgetbookFolder(
        name: 'screens',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'OtpScreen',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i5.defaultButtonUseCase,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'SignupScreen',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i6.defaultAythScreenUseCase,
            ),
          ),
        ],
      ),
    ],
  ),
];

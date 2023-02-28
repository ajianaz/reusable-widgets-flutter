import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:substring_highlight/substring_highlight.dart';

import 'CTextField.dart';

class CAutoComplete<T extends Object> extends StatelessWidget {
  final String initialValue;
  final List<T> list;
  final String keyElement;
  final Function(T) onSelected;
  TextEditingController fieldController;

  String? hint;
  AutovalidateMode? autoValidateMode;
  InputDecoration? decorationField;
  Widget Function(BuildContext, Function(T), Iterable<T>)? optionsViewBuilder;
  Widget Function(BuildContext, TextEditingController, FocusNode, VoidCallback)?
      fieldViewBuilder;

  CAutoComplete(this.initialValue, this.list, this.keyElement, this.onSelected,
      this.fieldController,
      {this.hint, this.autoValidateMode, this.fieldViewBuilder, this.decorationField});

  objectToString(T element) {
    String json = jsonEncode(element);
    Map<String, dynamic> jsonObj = jsonDecode(json);
    return "${jsonObj[keyElement]}";
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete<T>(
      initialValue: TextEditingValue(text: initialValue ?? ''),
      onSelected: onSelected,
      optionsBuilder: (text) {
        if (text.text.isEmpty) {
          return list;
        } else {
          return (list).where((element) {
            String value = objectToString(element);
            return value.toLowerCase().contains(text.text.toLowerCase());
          });
        }
      },
      displayStringForOption: (value) {
        return objectToString(value);
      },
      optionsViewBuilder: optionsViewBuilder ??
          (context, onSelected, options) {
            return Align(
              alignment: Alignment.topCenter,
              child: Material(
                elevation: 4.0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: context.width - 20, maxHeight: 150),
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final data = options.elementAt(index);
                        String value = objectToString(data);

                        return ListTile(
                          title: SubstringHighlight(
                            text: value,
                            term: fieldController.text,
                            textStyleHighlight:
                                const TextStyle(fontWeight: FontWeight.w700),
                          ),
                          onTap: () {
                            onSelected(data);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(
                            height: 1,
                          ),
                      itemCount: options.length),
                ),
              ),
            );
          },
      fieldViewBuilder: fieldViewBuilder ??
          (context, controller, focusNode, onEditingComplete) {
            this.fieldController = controller;
            String hint = this.hint ?? "Cari dan pilih salah satu";
            return CTextField(
              controller: controller,
              focusNode: focusNode,
              hintText: hint,
              onEditingComplete: onEditingComplete,
              decoration: decorationField,
              autoValidateMode:
                  autoValidateMode ?? AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (GetUtils.isBlank(value) == true) {
                  return "Tidak boleh kosong";
                }
                Iterable<T> data = list.where((element) {
                  String string = objectToString(element);
                  return string == value;
                });
                if (data.isEmpty) {
                  return "Silahkan pilih salah satu dari pilihan yang ada";
                }
                return null;
              },
            );
          },
    );
  }
}

import 'package:flutter/material.dart';
import 'getterSetter.dart';

class ProviderForTextField with ChangeNotifier {
  int countTextField = 0;
  List<String> listField = [""];
  List<GetASet> listFunction = [GetASet()];

  List<GetASet> get listFunctionProvider => listFunction;
  List<String> get listFieldProvider => listField;
  int get countTextFieldProvider => countTextField;
  set countTextFieldProvider(int index) {
    countTextField = index;
    listField = List<String>.generate(index, (int index) => "");
    listFunction = listField.map((e) => GetASet()).toList();
    notifyListeners();
  }

  void dialogItem(GlobalKey<FormState> keys, GetASet getter, BuildContext context, Widget widgets){
    modalDialogItem(keys, getter,context, widgets);
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'method.dart';
import 'getterSetter.dart';
import 'widget.dart';

class WidgetEditGist extends StatelessWidget {
  final List<String> gistOpened;
  final GlobalKey<FormState> keys;
  final List<Function(String)> function;
  const WidgetEditGist({this.gistOpened, this.keys, this.function});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: keys,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Center(
          child: ListView.builder(
              itemCount: gistOpened.length,
              itemBuilder: (context, index) {
                return textFormFields(
                    initialValue: gistOpened[index], onSaved: function[index]);
              }),
        ),
      ),
    );
  }
}

class WidgetBaru extends StatelessWidget {
  GlobalKey keys = new GlobalKey<FormState>();

  GetASet singleaset = GetASet();

  GlobalKey keys2 = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<String> listInitial = ["",""];
    List<GetASet> listGetterSetter = listInitial.map((e) => GetASet()).toList();
    return  Scaffold(
            appBar: AppBar(),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonPrintTextFieldValues(keys, listGetterSetter),
                // showForm.showForm()
              ],
            ),
            body: WidgetEditGist(
                gistOpened: listInitial,
                keys: keys,
                function: listGetterSetter
                    .map((e) => Valid(e).saver)
                    .toList(),
              ),
            );
  }
}

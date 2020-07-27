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
  @override
  Widget build(BuildContext context) {
    GlobalKey keys = new GlobalKey<FormState>();

    GetASet singleaset = GetASet();
    Valid singleValid = Valid(singleaset);

    GlobalKey keys2 = new GlobalKey<FormState>();
    return ChangeNotifierProvider<ProviderForTextField>(
        create: (context) => ProviderForTextField(),
        child: Scaffold(
            appBar: AppBar(),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buttonPrintTextFieldValues(keys, context),
                // buttonAddTextFieldCount(keys2,context,singleaset)
                showForm(keys2, singleaset)
              ],
            ),
            body: Consumer<ProviderForTextField>(
                builder: (context, crud, _) =>  WidgetEditGist(
                        gistOpened: crud.listFieldProvider,
                        keys: keys,
                        function: crud.listFunctionProvider
                            .map((e) => Valid(e).saver)
                            .toList(),
                      ),
                    )));
  }
}

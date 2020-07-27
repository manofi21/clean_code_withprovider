Widget buttonPrintTextFieldValues(
    GlobalKey<FormState> keys, BuildContext context) {
  return Consumer<ProviderForTextField>(
    builder: (context, crud, _) => FloatingActionButton(
        heroTag: 'update gist',
        child: Icon(Icons.update),
        onPressed: () {
          keys.currentState.save();
          crud.listFunctionProvider.forEach((element) {
            print(element.str_name);
          });
        }),
  );
}

Widget textFormFields({String initialValue, Function onSaved}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 8),
    child: new TextFormField(
      initialValue: initialValue,
      onSaved: onSaved,
      decoration: InputDecoration(border: OutlineInputBorder()),
    ),
  );
}

Widget buttonAddTextFieldCount(
    GlobalKey<FormState> keys, BuildContext context, GetASet parts) {
  return Consumer<ProviderForTextField>(
      builder: (context, crud, _) => FloatingActionButton(
          heroTag: 'update gist',
          child: Icon(Icons.print),
          onPressed: () {
            keys.currentState.save();
            crud.countTextFieldProvider = int.parse(parts.str_name);
          }));
}

void modalDialogItem(
    GlobalKey<FormState> keys, GetASet getter, BuildContext context, Widget widgets) {
  AlertDialog alerts = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      titlePadding: EdgeInsets.zero,
      content: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Form(
                  key: keys,
                  child: textFormFields(
                    initialValue: "1",
                    onSaved: Valid(getter).saver,
                  )),
              widgets
              // buttonAddTextFieldCount(keys,context, getter)
            ],
          )));
  showDialog(context: context, builder: (BuildContext context) => alerts);
}

Widget showForm(GlobalKey<FormState> keys, GetASet getter) {
  return Consumer<ProviderForTextField>(
      builder: (context, crud, _) => FloatingActionButton(
            onPressed: () => crud.dialogItem(
                keys,
                getter,
                context,
                FloatingActionButton(
                    heroTag: 'update gist',
                    child: Icon(Icons.print),
                    onPressed: () {
                      keys.currentState.save();
                      crud.countTextFieldProvider = int.parse(getter.str_name);
                    })),
            child: Icon(Icons.add),
          ));
}

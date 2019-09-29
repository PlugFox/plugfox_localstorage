import 'package:flutter/material.dart';
import 'package:plugfox_localstorage/localstorage.dart';

void main() => runApp(App());

const String title = 'PlugFox local storage sample demo';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          buttonColor: Colors.deepOrange,
        ),
        home: Screen(),
      );
}

class Screen extends StatefulWidget {
  Screen({Key key}) : super(key: key);
  final LocalStorage localStorage = LocalStorage();
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _valueController;
  bool _isInit = false;
  String _key = '';
  String _value = '';

  static const Padding topPadding = const Padding(
    padding: const EdgeInsets.only(top: 50),
  );

  @override
  void initState() {
    super.initState();
    this._valueController = TextEditingController(
      text: '',
    );
    widget.localStorage.init().whenComplete(
          () => setState(() {
            this._isInit = true;
          }),
        );
  }

  @override
  void dispose() {
    widget.localStorage.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: this._scaffoldKey,
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Builder(
            builder: (BuildContext ctx) => Form(
              key: this._formKey,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 0,
                ),
                children: <Widget>[
                  topPadding,
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Key',
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    validator: _validateKeyField,
                    readOnly: !this._isInit,
                    onSaved: (String v) => setState(() => this._key = v),
                  ),
                  RaisedButton(
                    child: const Text('Get value'),
                    onPressed: this._isInit ? this._getValue : null,
                  ),
                  topPadding,
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Value',
                    ),
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    readOnly: !this._isInit,
                    controller: this._valueController,
                    onSaved: (String v) => setState(() => this._value = v),
                  ),
                  RaisedButton(
                    child: const Text('Set value'),
                    onPressed: this._isInit ? this._setValue : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  String _validateKeyField(String value) =>
      value.isEmpty ? 'Plz, input KEY in the KEY field.' : null;

  void _getValue() {
    final FormState form = this._formKey.currentState;
    if (form.validate()) {
      form.save();
      this._value = widget.localStorage[this._key];
      this._valueController.text = this._value;
      this._showSnackBar();
    }
  }

  void _setValue() {
    final FormState form = this._formKey.currentState;
    if (form.validate()) {
      form.save();
      widget.localStorage[this._key] = this._value;
      this._showSnackBar();
    }
  }

  void _showSnackBar() => this._scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('${this._key} = ${this._value}'),
        duration: const Duration(
          seconds: 1,
        ),
      ));
}

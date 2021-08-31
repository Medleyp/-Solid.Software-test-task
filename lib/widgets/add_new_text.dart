import 'package:flutter/material.dart';

class AddNewText extends StatefulWidget {
  final Function _fatchNewText;
  const AddNewText({Key? key, required Function function})
      : _fatchNewText = function,
        super(key: key);

  @override
  _AddNewTextState createState() => _AddNewTextState();
}

class _AddNewTextState extends State<AddNewText> {
  final _newTextController = TextEditingController();

  void _submitData() {
    if (_newTextController.text.isEmpty) {
      _buildErrorWidget();
    } else {
      widget._fatchNewText(_newTextController.text);
      Navigator.of(context).pop();
    }
  }

  void _buildErrorWidget() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('An Error Occurred'),
        content: const Text('Please, enter some text'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Okey'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'New Text'),
                controller: _newTextController,
                onSubmitted: (_) => _submitData(),
              ),
              TextButton(
                onPressed: _submitData,
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:string_validator/string_validator.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({Key key}) : super(key: key);
  @override
  _ContactMeState createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final _formKey = GlobalKey<FormState>();
  String name, phone, email, details;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(
        24,
      ),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Align(
          child: Text(
            'Contact Me',
            textScaleFactor: 2,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              TextFormField(
                cursorColor: Theme.of(context).accentColor,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        18,
                      ),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Name cannot be empty' : null,
                onChanged: (value) => setState(() {
                  name = value.trim();
                }),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                cursorColor: Theme.of(context).accentColor,
                decoration: const InputDecoration(
                  labelText: 'Phone Number(With Country Code)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        18,
                      ),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                ),
                validator: (value) => !isNumeric(value)
                    ? 'Invalid PhoneNumber'
                    : !isLength(value, 12, 12) ? 'Invalid PhoneNumber' : null,
                onChanged: (value) => setState(() {
                  phone = value.trim();
                }),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                cursorColor: Theme.of(context).accentColor,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        18,
                      ),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                ),
                validator: (value) => value.isEmpty
                    ? 'Email cannot be empty'
                    : !isEmail(value) ? 'Invalid Email' : null,
                onChanged: (value) => setState(() {
                  if (isEmail(value))
                    email = toString(normalizeEmail(value)).trim();
                }),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                cursorColor: Theme.of(context).accentColor,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        18,
                      ),
                    ),
                  ),
                  labelText: 'Message',
                  helperMaxLines: 7,
                  hintMaxLines: 7,
                  prefixIcon: Icon(
                    Icons.speaker_notes,
                  ),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Description cannot be empty' : null,
                onChanged: (value) => setState(
                  () => details = stripLow(toString(value).trim()),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 7,
              ),
              Center(
                child: FloatingActionButton.extended(
                  elevation: 2,
                  highlightElevation: 4,
                  tooltip: 'Submit Details',
                  hoverElevation: 4,
                  icon: const Icon(
                    Icons.send,
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      final _timestamp = DateFormat('yMMMd')
                          .add_jms()
                          .format(
                            DateTime.now(),
                          )
                          .trim();
                      final _ipData = '?name=$name'
                          '&phone=$phone'
                          '&email=$email'
                          '&details=$details'
                          '&timestamp=$_timestamp';
                      const url =
                          'https://script.google.com/macros/s/AKfycbxQcurKy1qVSt3-mQClYwLVlCXroYYdMJ_LQJiazL-k4cqeBD3c/exec';

                      try {
                        await Dio()
                            .get(
                              url + _ipData,
                            )
                            .then(
                              (value) => value.statusCode == 200
                                  ? Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green.shade500,
                                        content: Text(
                                          'Submitted',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Scaffold.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.green.shade500,
                                        content: Text(
                                          'Error Occured',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                            );
                      } on Exception catch (e) {
                        Exception(e);
                      }
                    }
                  },
                  label: Text('Send'),
                ),
              ),
            ]
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: e,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

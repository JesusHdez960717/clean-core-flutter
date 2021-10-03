import 'dart:async';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_example/core/module/ObjectBoxCoreModule.dart';
import 'package:objectbox_example/core/usecase_impl/ObjectBoxUseCaseImplExporter.dart';
import 'package:objectbox_example/repo/repo_impl/RepoImplExporter.dart';

import 'core/domain/ParentDomain.dart';
import 'core/usecase_def/ParentUseCase.dart';
import 'objectbox.g.dart';

// ignore_for_file: public_member_api_docs
//flutter pub run build_runner build
void main() => runApp(MyApp()); //flutter run -t lib/main.dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'OB Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'OB Example'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _noteInputController = TextEditingController();
  late final ParentUseCase parentUseCase;

  final faker = Faker();

  void _addNote(String text) {
    if (text.isEmpty) return;
    parentUseCase.create(ParentDomain(
        name: text,
        bornDay: faker.date.dateTime(minYear: 1980, maxYear: 2000)));
    _noteInputController.text = '';
  }

  bool init = false;

  @override
  void initState() {
    super.initState();
    ObjectBoxCoreModule.init().then((value) {
      parentUseCase = ObjectBoxCoreModule.PARENT_USECASE;
      init = true;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _noteInputController.dispose();
    ObjectBoxCoreModule.PARENT_USECASE.streamController().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              key: Key('submit'),
              onPressed: () => _addNote(faker.person.name()),
              icon: Icon(Icons.add),
            )
          ],
        ),

        body: init == false
            ? Container(
                height: 200,
                width: 200,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter a new note'),
                                controller: _noteInputController,
                                onSubmitted: (value) =>
                                    _addNote(_noteInputController.text),
                                // Provide a Key for the integration test
                                key: Key('input'),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0, right: 10.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Tap a note to remove it',
                                  style: TextStyle(
                                    fontSize: 11.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: StreamBuilder<List<ParentDomain>>(
                        stream: ObjectBoxCoreModule.PARENT_USECASE
                            .streamController()
                            .stream,
                        builder: (context, snapshot) => ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            itemCount:
                                snapshot.hasData ? snapshot.data!.length : 0,
                            itemBuilder: _itemBuilder(snapshot.data ?? []))))
              ]),
        // We need a separate submit button because flutter_driver integration
        // test doesn't support submitting a TextField using "enter" key.
        // See https://github.com/flutter/flutter/issues/9383
        floatingActionButton: FloatingActionButton(
          key: Key('submit'),
          onPressed: () => _addNote(_noteInputController.text),
          child: Icon(Icons.add),
        ),
      );

  GestureDetector Function(BuildContext, int) _itemBuilder(
          List<ParentDomain> notes) =>
      (BuildContext context, int index) => GestureDetector(
            onTap: () => parentUseCase.destroy(notes[index]),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 18.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            notes[index].name,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                            // Provide a Key for the integration test
                            key: Key('list_item_$index'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.0),
                            child: Text(
                              'Added on ${DateFormat.yMMMd().format(notes[index].bornDay)}',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
}

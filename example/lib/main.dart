import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:clean_core_example/clean_core_example.dart';

void main() => runApp(MyApp()); //flutter run -t lib/main.dart

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Clean Core Example',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(title: 'Clean Core Example'),
      );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final faker = Faker();

  void _addParent() {
    CleanCoreExampleCoreModule.parentUseCase.create(ParentDomain(
        name: faker.person.name(),
        bornDay: faker.date.dateTime(minYear: 1980, maxYear: 2000)));
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("created"),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  void _editParent(ParentDomain parent) {
    parent.name = faker.person.name();

    CleanCoreExampleCoreModule.parentUseCase.edit(parent);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("edited"),
          duration: Duration(milliseconds: 1500),
          backgroundColor: Colors.blue,
        ),
      );
    });
  }

  void _destroyParent(ParentDomain parent) {
    ParentDomain dest =
        CleanCoreExampleCoreModule.parentUseCase.destroy(parent);
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "deleted $dest, length: ${CleanCoreExampleCoreModule.parentUseCase.count()}"),
          backgroundColor: Colors.red,
        ),
      );
    });
  }

  void _findParent() {
    List<ParentDomain> all =
        CleanCoreExampleCoreModule.parentUseCase.findAll();
    ParentDomain randomParent = all[Random().nextInt(all.length)];

    ParentDomain selectedParent =
        CleanCoreExampleCoreModule.parentUseCase.findBy(randomParent.id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("findBy $selectedParent"),
        duration: Duration(milliseconds: 1500),
        backgroundColor: Colors.purple,
      ),
    );
  }

  @override
  void initState() {
    CleanCoreExampleCoreModule.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
              key: Key('find'),
              tooltip: "Find By random id",
              onPressed: _findParent,
              icon: Icon(Icons.find_in_page_outlined),
            ),
            IconButton(
              key: Key('action use case'),
              tooltip: "Call method in the use case",
              onPressed: () => {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(CleanCoreExampleCoreModule.parentUseCase
                        .doStuffInUseCase()),
                    duration: Duration(milliseconds: 1500),
                    backgroundColor: Colors.pink,
                  ),
                )
              },
              icon: Icon(Icons.person),
            ),
            IconButton(
              key: Key('action use case down'),
              tooltip: "Call method in repo, delegated by the use case",
              onPressed: () => {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(CleanCoreExampleCoreModule.parentUseCase
                        .doStuffDeeper()),
                    duration: Duration(milliseconds: 1500),
                    backgroundColor: Colors.yellow,
                  ),
                )
              },
              icon: Icon(Icons.watch),
            )
          ],
        ),
        body: generateList(
          CleanCoreExampleCoreModule.parentUseCase.findAll(),
        ),
        floatingActionButton: FloatingActionButton(
          key: Key('submit'),
          onPressed: _addParent,
          child: Icon(Icons.add),
        ),
      );

  Widget generateList(List<ParentDomain> list) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(
              label: Text('id'),
            ),
            DataColumn(
              label: Text('name'),
            ),
            DataColumn(
              label: Text('date'),
            ),
            DataColumn(
              label: Text('action'),
            ),
          ],
          rows: list
              .map(
                (item) => DataRow(
                  cells: [
                    DataCell(
                      Text(item.id.toString()),
                    ),
                    DataCell(
                      Text(item.name),
                    ),
                    DataCell(
                      Text(item.bornDayFormat),
                    ),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              _editParent(item);
                            },
                            icon: Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              _destroyParent(item);
                            },
                            icon: Icon(Icons.delete_forever),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

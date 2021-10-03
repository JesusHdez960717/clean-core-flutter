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
  final _noteInputController = TextEditingController();

  final faker = Faker();

  void _addPerson(String text) {
    if (text.isEmpty) return;
    CleanCoreExampleCoreModule.PARENT_USECASE.create(ParentDomain(
        name: text,
        bornDay: faker.date.dateTime(minYear: 1980, maxYear: 2000)));
    _noteInputController.text = '';
    setState(() {});
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
              key: Key('submit'),
              onPressed: () => _addPerson(faker.person.name()),
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: generateList(
          CleanCoreExampleCoreModule.PARENT_USECASE.findAll(),
        ),
        floatingActionButton: FloatingActionButton(
          key: Key('submit'),
          onPressed: () => _addPerson(_noteInputController.text),
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
                      IconButton(
                        onPressed: () {
                          CleanCoreExampleCoreModule.PARENT_USECASE
                              .destroy(item);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete_forever),
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

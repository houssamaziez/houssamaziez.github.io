import 'package:flutter/material.dart';

List<Client> listgroup = [];

class ScreenClassment extends StatefulWidget {
  const ScreenClassment({super.key});

  @override
  State<ScreenClassment> createState() => _ScreenClassmentState();
}

class _ScreenClassmentState extends State<ScreenClassment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ClientTable(clients: listgroup),
            TextButton(
                onPressed: () {
                  _addgroup(context);
                },
                child: Text("Add group"))
          ],
        ),
      ),
    );
  }

  Future<String> _addgroup(
    context,
  ) async {
    TextEditingController controller = TextEditingController();

    String result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("انشاء مجموعة جديدة"),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: "ادخل اسم الفريق",
            ),
          ),
          actions: [
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  if (controller.text.isEmpty) {
                  } else {
                    listgroup.add(Client(name: controller.text, price: 0));
                  }
                });
                Navigator.of(context).pop('Saved Text');
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
          ],
        );
      },
    );

    return result;
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(label: Text('Column 1')),
        DataColumn(label: Text('Column 2')),
        DataColumn(label: Text('Column 3')),
      ],
      rows: [
        DataRow(cells: [
          DataCell(Text('Row 1, Column 1')),
          DataCell(Text('Row 1, Column 2')),
          DataCell(Text('Row 1, Column 3')),
        ]),
        DataRow(cells: [
          DataCell(Text('Row 2, Column 1')),
          DataCell(Text('Row 2, Column 2')),
          DataCell(Text('Row 2, Column 3')),
        ]),
      ],
    );
  }
}

class ClientTable extends StatefulWidget {
  final List<Client> clients;

  const ClientTable({required this.clients});

  @override
  State<ClientTable> createState() => _ClientTableState();
}

class _ClientTableState extends State<ClientTable> {
  @override
  Widget build(BuildContext context) {
    // Sort the clients by price
    widget.clients.sort((b, a) => a.price.compareTo(b.price));

    return DataTable(
      columns: [
        DataColumn(
            label: InkWell(
                onTap: () {},
                child: Text('اسم الفريق', style: TextStyle(fontSize: 40)))),
        DataColumn(
            label: Text(
          'مجموع النقاط',
          style: TextStyle(fontSize: 40),
        )),
      ],
      rows: widget.clients
          .map((client) => DataRow(cells: [
                DataCell(Text(client.name)),
                DataCell(Row(
                  children: [
                    Text(' ${client.price}', style: TextStyle(fontSize: 40)),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          _showEditClientDialog(client);
                        },
                        icon: Icon(Icons.edit))
                  ],
                )),
              ]))
          .toList(),
    );
  }

  Future<String> _showEditClientDialog(Client client) async {
    TextEditingController? controller = TextEditingController();
    String result = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Client'),
          content: TextField(
            decoration: InputDecoration(
              hintText: 'Enter a new name',
            ),
            controller: controller..text = client.price.toString(),
          ),
          actions: [
            TextButton(
              child: Text('Save'),
              onPressed: () {
                for (var i = 0; i < listgroup.length; i++) {
                  if (listgroup[i] == client) {
                    setState(() {
                      listgroup[i].price = int.parse(controller.text);
                    });
                  } else {}
                }

                Navigator.of(context).pop(client.name);
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
          ],
        );
      },
    );

    return result;
  }
}

class Client {
  String name;
  var price;

  Client({required this.name, required this.price});
}

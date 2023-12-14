import 'package:flutter/material.dart';

void main() {
  runApp(NotasApp());
} // chamar a tela

//responsavel pelo layout
class NotasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CEET Vasco - Coutinho',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotaScreen(),
    );
  }
}

class NotaScreen extends StatefulWidget {
  const NotaScreen({super.key});

  @override
  State<NotaScreen> createState() => _NotaScreenState();
}

//mexer sempre na build, criar métodos também sempre abaixo do list
class _NotaScreenState extends State<NotaScreen> {
  List<Contact> contacts = []; //armazenar infor

  //método
  void _showAddNotetDialog() {
    //botao
    showDialog(
      context: context,
      builder: (context) {
        //informa algumas propriedades dentro do código
        String data = "";
        String descricao = "";
        String nome = "";

        return AlertDialog(
          title: Text('ADICIONAR NOTAS'),
          content: Column(
            children: [
              TextField(
                onChanged: (value) {
                  data = value;
                },
                decoration: InputDecoration(labelText: 'DATA'),
              ),
              TextField(
                onChanged: (value) {
                  descricao = value;
                },
                decoration: InputDecoration(labelText: 'NOME'),
              ),
              TextField(
                onChanged: (value) {
                  descricao = value;
                },
                decoration: InputDecoration(labelText: 'DESCRIÇÃO'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  contacts.add(
                      Contact(data: data, descricao: descricao, nome: nome));
                });
              },
              child: Text('ADICIONAR'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('CANCELAR'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //widgets
      appBar: AppBar(
        //widgets
        title: const Text('CEET Vasco - Coutinho'),
      ),
      body: ListView.builder(
        //corpo
        itemCount: contacts.length, //tamanho +1
        itemBuilder: (context, index) {
          return Card(
            //sempre será assim (widgets)
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(contacts[index].data),
              subtitle: Text(contacts[index].descricao),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddNotetDialog();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

//criar classe Contacts
class Contact {
  final String data;
  final String descricao;
  final String nome;

  //construtor
  Contact({required this.data, required this.nome, required this.descricao});
}

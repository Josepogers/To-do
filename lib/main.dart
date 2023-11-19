/// Este código em Dart cria um aplicativo simples em Flutter que exibe uma lista de tarefas
/// e permite que o usuário as marque como concluídas ou não utilizando checkboxes.

// Importando pacotes necessários do Flutter
import 'package:flutter/material.dart';
import 'models/item.dart';

// Ponto de entrada do aplicativo
void main() => runApp(const App());

// Widget principal do aplicativo
class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    // O widget MaterialApp é a raiz da aplicação Flutter
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(), // Definindo a rota inicial para o widget HomePage
    );
  }
}

// Widget da página inicial
class HomePage extends StatefulWidget {
  var items = <Item>[]; // Lista para armazenar os itens de tarefa

  // Construtor para inicializar a lista com algumas tarefas
  HomePage() {
    items = [];
    items.add(Item(title: "tarefa 1", done: false));
    items.add(Item(title: "tarefa 2", done: false));
    items.add(Item(title: "tarefa 3", done: false));
  }

  @override
  State<HomePage> createState() =>
      _HomePageState(); // Criando o estado para HomePage
}

// Classe de estado para HomePage
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // O widget Scaffold representa a estrutura visual básica do design de material
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de tarefas"), // Definindo o título da AppBar
      ),
      body: Column(
        // O widget Column organiza os widgets filhos verticalmente
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinhando os filhos à esquerda
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Adicionar uma nova tarefa", // Widget Text exibindo um título
              style: TextStyle(fontSize: 18),
            ),
          ),
          TextFormField(
            //cria um campo de formulario
            keyboardType: TextInputType
                .text, //Define o tipo de texto que será enserido no input
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Suas tarefas:", // Widget Text exibindo um título
              style: TextStyle(fontSize: 18),
            ),
          ),
          Expanded(
            child: ListView.builder(
              // ListView.builder cria uma lista rolável de widgets
              itemCount: widget.items.length, // Número de itens na lista
              itemBuilder: (BuildContext context, int index) {
                final item = widget.items[index]; // Obtendo o item atual
                return CheckboxListTile(
                  // CheckboxListTile representa um único item na lista
                  title: Text(item.title), // Exibindo o título da tarefa
                  key: Key(item.title),
                  value: item.done, // Estado atual da tarefa
                  onChanged: (value) {
                    setState(() {
                      // setState aciona uma reconstrução, atualizando a interface com o novo estado
                      item.done = value; // Alterando o estado da tarefa
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

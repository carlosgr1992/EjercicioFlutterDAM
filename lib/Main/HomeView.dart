import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../firestoreObjects/FbUsuario.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  late List<FbUsuario> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Puedes ajustar el número de columnas aquí
        ),
        itemCount: users.length,
        itemBuilder: creaGridItem,
      ),
    );
  }

  Widget creaGridItem(BuildContext context, int indice) {
    return Card(
      child: Column(
        children: [
          Text('Nombre: ${users[indice].name}'),
          Text('Edad: ${users[indice].age.toString()}'),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
    // Llama a la función que obtiene los datos al cargar la vista.
    fetchData();
  }

  Future<void> fetchData() async {
    // Realiza una consulta a la colección "Usuarios" en Firestore.
    final QuerySnapshot usersSnapshot = await db.collection('Usuarios').get();

    // Itera sobre los documentos para obtener los datos y almacenarlos en la lista.
    final List<FbUsuario> userList = [];
    for (final DocumentSnapshot userDoc in usersSnapshot.docs) {
      final user = FbUsuario.fromFirestore(userDoc as DocumentSnapshot<Map<String, dynamic>>, null);
      userList.add(user);
    }

    // Actualiza el estado para reflejar los datos obtenidos.
    setState(() {
      users = userList;
    });
  }
}

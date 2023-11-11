import 'package:cloud_firestore/cloud_firestore.dart';

import '../firestoreObjects/FbPost.dart';

class DataHolder {

  static final DataHolder _dataHolder = new DataHolder._internal();

  FirebaseFirestore db = FirebaseFirestore.instance;
  late String sTitulo;
  late String sCuerpo;
  late FbPost selectedPost;

  DataHolder._internal(){   //Constructor

    sTitulo = "titulo";
    sCuerpo = "cuerpo";

  }

  factory DataHolder(){
    return _dataHolder;
   }

   void crearPostEnFireBase(FbPost fbPost){

     CollectionReference<FbPost> postsRef = db.collection("Posts")
         .withConverter(
       fromFirestore: FbPost.fromFirestore,
       toFirestore: (FbPost post, _) => post.toFirestore(),
     );
   }

  }
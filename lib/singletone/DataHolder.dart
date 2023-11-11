import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../firestoreObjects/FbPost.dart';

class DataHolder {

  static final DataHolder _dataHolder = new DataHolder._internal();

  FirebaseFirestore db = FirebaseFirestore.instance;
  late String sTitulo;
  late String sCuerpo;
  late FbPost selectedPost;

  DataHolder._internal(){   //Constructor


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

   void initDataHolder(){

     sTitulo = "titulo";
     sCuerpo = "cuerpo";
     cargarCacheFbPost();
   }

   void guardaSelectedPostCache() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     prefs.setString('fbPost_titulo', selectedPost.title);
     prefs.setString('fbPost_cuerpo', selectedPost.body);
     prefs.setString('fbPost_url', selectedPost.urlImg);
   }

   void cargarCacheFbPost() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? fbPost_titulo = prefs.getString('fbPost_titulo');
    fbPost_titulo ??= "";

    String? fbPost_cuerpo = prefs.getString('fbPost_cuerpo');
    fbPost_cuerpo ??= "";

    String? fbPost_url = prefs.getString('fbPost_url');
    fbPost_url ??= "";

    selectedPost = FbPost(title: fbPost_titulo, body: fbPost_cuerpo, urlImg: fbPost_url);

   }

  }
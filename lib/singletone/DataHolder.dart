import '../firestoreObjects/FbPost.dart';

class DataHolder {

  static final DataHolder _dataHolder = new DataHolder._internal();

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

  }
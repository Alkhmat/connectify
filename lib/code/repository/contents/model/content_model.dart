import 'package:cloud_firestore/cloud_firestore.dart';

class ContentModel {
  final String id;
  final String type;
  final String url;

  ContentModel({required this.id, required this.type, required this.url});

  factory ContentModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ContentModel(
      id: doc.id,
      type: data['type'],
      url: data['url'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'type': type,
      'url': url,
    };
  }
}

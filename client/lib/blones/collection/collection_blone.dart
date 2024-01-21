import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../models/ui_message.dart';
import '../app_blone.dart';
import '../blone.dart';

typedef JsonMap = Map<String, dynamic>;

enum Intent { get, post, patch, delete, rpc }

abstract class SupabaseCollection<T> implements ChildBlone<AppBlone> {
  static const uuid = Uuid();

  String get tableName;

  SupabaseClient get client => parent.supabaseClient;

  SupabaseQueryBuilder get fromTable => client.from(tableName);

  T elementFromJson(JsonMap json);

  JsonMap elementToJson(T value);

  Future<bool> insert(List<T> values) async {
    final serialized = values.map((v) => elementToJson(v)).toList();
    try {
      await fromTable.insert(serialized);
    } on PostgrestException catch (_) {
      return false;
    }
    return true;
  }

  Future<bool> save(T value) async {
    final serialized = elementToJson(value);
    try {
      await fromTable.upsert(serialized);
    } on PostgrestException catch (e) {
      parent.showMessage(UIMessage.error("Erreur : ${e.message}"));
      return false;
    }
    return true;
  }

  Future<T> getById(String id) async {
    final data = await fromTable.select().match({'id': id}).single();
    return elementFromJson(data);
  }

  Future<bool> delete(String id) async {
    try {
      await fromTable.delete().match({'id': id});
    } catch (e) {
      return false;
    }
    return true;
  }
}

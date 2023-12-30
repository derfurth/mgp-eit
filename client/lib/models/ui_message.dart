import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_message.freezed.dart';

@freezed
class UIMessage with _$UIMessage {
  const factory UIMessage.loading() = Loading;

  const factory UIMessage.download(String message) = Download;

  const factory UIMessage.save(String message) = Save;

  const factory UIMessage.saveError(String message) = SaveError;

  const factory UIMessage.auth(String message) = Auth;

  const factory UIMessage.authError(String message) = AuthError;

  const factory UIMessage.error(String message) = Error;

  const factory UIMessage.plain(String message) = Plain;

  const factory UIMessage.none() = None;
}

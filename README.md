# hat_game

Приложение-компаньон для "Шляпы".

## Разработка

1. Установите Flutter по инструкции из официальной [документации](https://docs.flutter.dev/get-started/install);
2. Установите [Just](https://github.com/casey/just);
3. Установите утилиты для кодогенерации gRPC кода (см. [документацию](https://grpc.io/docs/languages/dart/quickstart/)):
   1. [Компилятор protoc](https://grpc.io/docs/protoc-installation/);
   2. Плагин для генерации Dart кода:
      1. Выполните команду `dart pub global activate protoc_plugin`;
      2. Добавьте в `PATH` путь к глобальным утилитам Dart `~/.pub-cache/bin` (`export PATH="$PATH:$HOME/.pub-cache/bin"`);
4. Склонируйте этот проект и откройте в VSCode;
5. Откройте рабочую область [`app`](/app.code-workspace);
6. Для отправки Ad-Hoc запросов на gRPC сервисы установите [gRPCCurl](https://github.com/fullstorydev/grpcurl) или Postman (см. [инструкцию](https://learn.microsoft.com/en-us/aspnet/core/grpc/test-tools?view=aspnetcore-7.0), часть про рефлексию смело игнорируйте: Dart-реализация gRPC ее не поддерживает).

Для регенерации gRPC кода выполните just-сценарий `grpc-gen`: `just grpc-gen`.

## Присоединение по ссылке

Формат ссылки: `hatgame://join?h=1.2.3.3&p=9001`. Настройки:

* Android -- [`AndroidManifest`](/android/app/src/main/AndroidManifest.xml);
* iOS -- [`Info.plist`](/ios/Runner/Info.plist).

Документация:

* <https://docs.flutter.dev/development/ui/navigation/deep-linking>
* <https://developer.android.com/training/app-links/deep-linking>
* <https://medium.com/wolox/ios-deep-linking-url-scheme-vs-universal-links-50abd3802f97>

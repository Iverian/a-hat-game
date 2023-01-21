# hat_game

Приложение-компаньон для "Шляпы".

## Разработка

1. Установите Flutter по инструкции из официальной [документации](https://docs.flutter.dev/get-started/install).
2. Установите [Just](https://github.com/casey/just)
3. Установите утилиты для кодогенерации gRPC кода (см. [документацию](https://grpc.io/docs/languages/dart/quickstart/)):
   1. [Компилятор protoc](https://grpc.io/docs/protoc-installation/)
   2. Плагин для генерации Dart кода:
      1. Выполните команду `dart pub global activate protoc_plugin`
      2. Добавьте в `PATH` путь к глобальным утилитам Dart `~/.pub-cache/bin` (`export PATH="$PATH:$HOME/.pub-cache/bin"`)
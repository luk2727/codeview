# server_alerts

Пакет с базовой логикой функционала алертов.

## Генерация файлов

### JSON
flutter packages pub run build_runner build
или
flutter packages pub run build_runner build --delete-conflicting-outputs

Если после запуска команды появляется лог "Bad state: Unexpected diagnostics: This requires the 'non-nullable' language feature to be enabled." и выполнение зацикливается - попробовать команду:
flutter packages pub upgrade

### Файлы локализации
Для генерации файлов строковых ресурсов и вспомагательных классов нужно запустить команду:
flutter pub run localization_helper:generate

Больше информации здесь: https://forexgames.atlassian.net/wiki/spaces/MC/pages/1357348865

### Ключи изображений
Для генерации классов работы с ассетами нужно запустить команду: 
flutter pub run assets_helper:generate

Больше информации здесь: https://forexgames.atlassian.net/wiki/spaces/MC/pages/1468989441
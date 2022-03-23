# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.0] - 2022-03-23
### Added
- Если source является симлинком, то бекапится только то, на что указывает симлинк
- Если destination существует, но не является директорием или симлинком на директорию, то скрипт выдает ошибку
- Каждое действия скрипта описано, сообщениями выдающимися на экран
- После прохождения условий, скрипт показывает результат "OK" или "FAIL"

## [0.2.0] - 2022-03-23
### Added
- Скрипт вызывается по образцу backup-dir path/to/source path/to/destination
- Файл бекапа соответствует формату <имя_архивируемой_папки>-<дата_создания бекапа_в_формате_iso8601>.tar.gz
- Бекапы складываются в папку destination. Если такой папки нет, скрипт ее создает
- Скрипт создает бекапы в формате tar.gz

## [0.1.0] - 2022-03-22
### Added
- Скрипт бекапит конкретную папку на сервер и создает архив в текущей директории
- source='/Users/ciberdroon/app_root'
  destination='/Users/ciberdroon/app14'

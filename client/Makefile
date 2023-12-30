.DEFAULT_GOAL := all

all: | pub_get build_runner_build build

pub_get:
	flutter pub get

build_runner_watch:
	flutter pub run build_runner watch --delete-conflicting-outputs

build_runner_build:
	flutter pub run build_runner build --delete-conflicting-outputs

build:
	flutter build web --no-sound-null-safety --release

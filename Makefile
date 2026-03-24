.PHONY: test
build-runner:
	dart run build_runner build --delete-conflicting-outputs
br-watch:
	dart run build_runner watch -d
analyze:
	flutter analyze
test:
	flutter test
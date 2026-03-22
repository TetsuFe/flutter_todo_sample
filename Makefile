.PHONY: test
build-runner:
	dart run build_runner build --delete-conflicting-outputs
analyze:
	flutter analyze
test:
	flutter test
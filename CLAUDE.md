# Flutter Todo Sample - CLAUDE.md

## Project Overview

A Flutter Todo app built as a portfolio project.

## Language Configuration
このプロジェクトは日本語環境での動作を前提とする。
基本的な受け答えは、全て日本語で行うこと。

コミュニケーション: 日本語で対応
コメント: コードコメントは日本語で記述
ドキュメント: 技術文書は日本語で作成
エラーメッセージ: 可能な限り日本語で表示
変数名・関数名: 英語を使用（国際的な慣例に従う）

## Architecture

3-layer Clean Architecture:

```
views/        -> UI layer (Widgets only, no business logic)
repositories/ -> Data access layer (interface + implementation separation)
models/       -> Data model layer (immutable models via Freezed)
services/     -> Business logic layer
```

## Tech Stack

| Purpose | Package |
|---------|---------|
| State management | `hooks_riverpod` + `riverpod_annotation` |
| UI hooks | `flutter_hooks` |
| Immutable models | `freezed` |
| Test mocking | `mockito` |
| Code generation | `build_runner` |

## Development Commands

```bash
# Code generation (Freezed + Riverpod providers)
make build-runner
# or: dart run build_runner build --delete-conflicting-outputs

# Static analysis
make analyze

# Run tests
make test
# or: flutter test
```

## Coding Conventions

### Models
- Define all models as immutable using `freezed`
- Mutations via `copyWith()`

### Repositories
- Always define an interface (`i_*.dart`) separate from the implementation
- Current implementation is in-memory (`InMemoryTaskRepository`), but the design allows future replacement with DB/API

### Riverpod Providers
- Use `@Riverpod` / `@riverpod` annotations for code generation
- Use `ConsumerWidget` / `HookConsumerWidget` in UI
- Local UI state (text fields, etc.) via `flutter_hooks` (`useXxx` hooks)

### Tests
- Repository layer: write unit tests
- Widget layer: mock repositories with Mockito, write widget tests
- Reset static store between tests to maintain test isolation

## File Naming & Placement

```
lib/models/           -> {name}.dart + {name}.freezed.dart
lib/repositories/     -> i_{name}_repository.dart, {impl}_repository.dart, providers.dart
lib/views/{feature}/  -> {feature}_list.dart, create_{feature}_modal.dart, providers.dart
test/repositories/    -> {name}_repository_test.dart
test/widgets/         -> {name}_test.dart
```

## CI

GitHub Actions runs automatically on push/PR to main (`.github/workflows/main.yaml`):
1. `flutter analyze` — static analysis
2. `flutter test --coverage` — tests with coverage

## Design Constraints & Intent

- **In-memory storage**: Data resets on app restart (intentional)
- **Pagination**: 20 items/page, infinite scroll for additional loading
- **Error handling**: Empty title validation is enforced at the repository layer
- **Japanese UI**: Labels and button text are written in Japanese

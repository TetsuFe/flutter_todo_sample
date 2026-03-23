---
allowed-tools: Bash
description: Flutter WebビルドをGitHub Pages（gh-pagesブランチ）にデプロイする
---

Flutter WebアプリをGitHub Pagesにデプロイしてください。
以下の手順を順番に実行し、エラーが発生したら即座に中断して日本語で原因を報告してください。

## 1. 事前確認

現在のブランチがmainであることを確認してください。

```bash
git branch --show-current
```

mainブランチ以外の場合は「デプロイはmainブランチから実行してください」と伝えて中断してください。

未コミットの変更がないか確認してください。

```bash
git status --short
```

未コミットの変更がある場合は警告し、続行するか確認してください。

## 2. Flutter Webビルド（mainブランチ上で実行）

```bash
flutter build web --base-href /flutter_todo_sample/
```

## 3. gh-pagesブランチへ切り替え

```bash
git checkout gh-pages
```

## 4. ビルド成果物をdocs/にコピー

```bash
cp -r build/web/. docs/
```

## 5. 変更確認

```bash
git status --short docs/
```

変更がない場合は「すでに最新のビルドがデプロイされています」と報告し、mainに戻って終了してください。

## 6. ステージング・コミット・プッシュ

```bash
git add docs/
git commit -m "Deploy Flutter Web"
git push origin gh-pages
```

## 7. mainブランチへ復帰

```bash
git checkout main
```

## 8. 完了報告

以下を日本語で報告してください。
- デプロイ完了メッセージ
- GitHub Pages URL: https://[GitHubユーザー名].github.io/flutter_todo_sample/
- デプロイしたコミットのハッシュ（`git log -1 --oneline gh-pages`で取得）

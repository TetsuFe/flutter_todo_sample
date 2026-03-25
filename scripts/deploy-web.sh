#!/bin/bash
# Flutter WebアプリをGitHub Pagesにデプロイするスクリプト
set -e

# 1. 事前確認: mainブランチであることを確認
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "main" ]; then
  echo "エラー: デプロイはmainブランチから実行してください（現在: $CURRENT_BRANCH）"
  exit 1
fi

# 未コミットの変更確認
UNCOMMITTED=$(git status --short)
if [ -n "$UNCOMMITTED" ]; then
  echo "警告: 未コミットの変更があります:"
  echo "$UNCOMMITTED"
  read -rp "このまま続行しますか？ [y/N]: " ANSWER
  if [[ ! "$ANSWER" =~ ^[Yy]$ ]]; then
    echo "デプロイを中断しました。"
    exit 1
  fi
fi

# 2. Flutter Webビルド（mainブランチ上で実行）
echo "Flutter Webをビルド中..."
flutter build web --base-href /flutter_todo_sample/

# 3. gh-pagesブランチへ切り替え
echo "gh-pagesブランチへ切り替え..."
git checkout gh-pages

# 4. ビルド成果物をdocs/にコピー
echo "ビルド成果物をdocs/にコピー中..."
cp -r build/web/. docs/

# 5. 変更確認
CHANGES=$(git status --short docs/)
if [ -z "$CHANGES" ]; then
  echo "すでに最新のビルドがデプロイされています。"
  git checkout main
  exit 0
fi

# 6. ステージング・コミット・プッシュ
echo "変更をコミット・プッシュ中..."
git add docs/
git commit -m "Deploy Flutter Web"
git push origin gh-pages

# 7. mainブランチへ復帰
git checkout main

# 8. 完了報告
# GITHUB_USER=$(git remote get-url origin | sed -E 's|.*github\.com[:/]([^/]+)/.*|\1|')
GITHUB_USER='tetsufe'
DEPLOY_COMMIT=$(git log -1 --oneline gh-pages)
echo ""
echo "デプロイが完了しました！"
echo "GitHub Pages URL: https://${GITHUB_USER}.github.io/flutter_todo_sample/"
echo "デプロイしたコミット: $DEPLOY_COMMIT"

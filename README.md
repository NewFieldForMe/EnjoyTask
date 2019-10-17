# EnjoyTask
## このアプリについて
開発手法を学習、試行しながらタスク管理アプリを開発する。アプリのコンセプトは以下の通り。
- タスクに対し、めんどくさい気持ちをゲーミフィケーションによって解消したい
- 毎日や隔週で発生するタスクをテンプレート化したい
- 家族と共有したい

## 開発環境
- macOS 10.15
- Xcode 11.1
  - CocoaPods
  - SwiftLint
CocoaPodsを使っているため、ソースコードをcloneした後 `pod install` を実行してください。

## 学習要素
- 単体テスト、UIテスト
- GitHub Actions
- Dark Mode対応

## 採用しているモバイルアーキテクチャ
- **VIPER**を採用。こちらが[公式サイト](https://cheesecakelabs.com/blog/ios-project-architecture-using-viper/)

## 単体テストとUIテストについて
- Cuckooを導入して、モックは自動生成（GeneratedMocks.swift）している。
- 自動生成ファイルはSwiftLintの対象外にしている。
- モックが必要なProtocolを追加した場合は、TestターゲットのRun ScriptにINPUT_FILEとして追加すること

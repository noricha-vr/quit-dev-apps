# Quit Dev Apps

深夜のプログラミングを防ぎ、健康的な開発生活をサポートするための自動シャットダウンツール。

## 🎯 目的 (Purpose)

多くの開発者は、集中するあまり深夜まで作業を続けてしまうことがあります。
このツールは、指定した時刻（例: 24時）に開発関連のアプリケーションを自動的に終了させることで、強制的に作業を中断させ、健康的なワークライフバランスを維持することを目的としています。

## ✨ 機能 (Features)

-   **指定アプリケーションの自動終了**:
    -   `Cursor`
    -   `PyCharm`
    -   `Visual Studio Code`
    -   `iTerm`
    -   `Terminal`
    -   その他、スクリプト内の `apps` 配列に追加したアプリケーション
-   **安全な2段階終了プロセス**:
    1.  まず、AppleScript を使用してアプリケーションに通常の終了コマンド (`quit`) を送信します。これにより、作業内容を保存する機会が提供されます。
    2.  10秒待機後、まだ終了していないアプリケーションがあれば `pkill` コマンドで強制的に終了させ、確実に作業を停止させます。

## 🛠️ 導入方法 (Setup)

1.  **リポジトリのクローン**:
    ```bash
    git clone https://github.com/your-username/quit-dev-apps.git
    cd quit-dev-apps
    ```

2.  **実行権限の付与**:
    スクリプトに実行権限を与えます。
    ```bash
    chmod +x quit-dev-apps.sh
    ```

3.  **cron による定期実行の設定**:
    `cron` を使って、毎日深夜0時（24時）にスクリプトが自動実行されるように設定します。

    -   crontab を編集モードで開きます。
        ```bash
        crontab -e
        ```
    -   以下の行を追記して保存します。（`YOUR_PATH_TO_SCRIPT` は `quit-dev-apps.sh` の絶対パスに書き換えてください）
        ```
        # 毎日 00:00 に開発アプリを終了する
        0 0 * * * /YOUR_PATH_TO_SCRIPT/quit-dev-apps.sh
        ```
        > **Tips**: `pwd` コマンドを実行すると、現在のディレクトリの絶対パスを簡単に確認できます。

## 🔧 カスタマイズ (Customization)

終了させたいアプリケーションのリストは、`quit-dev-apps.sh` スクリプトの `apps` 配列を直接編集することで自由に変更できます。

```sh
#!/bin/zsh
# ...

apps=(
  "Cursor"
  "Your-App"      # <--- ここに追加
  # ...
)

# ...
```

---

Let's quit on time and stay healthy! 

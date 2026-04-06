# midori-n8n

みどりAIエージェント — n8n ワークフロー（Render デプロイ用）

## デプロイ手順

### 1. GitHubリポジトリ作成
```
リポジトリ名: midori-n8n
アカウント: infoanymo
公開設定: Private推奨
```

### 2. このフォルダをpush
```bash
cd C:\Users\User\midori-n8n
git init
git add .
git commit -m "initial n8n setup"
git remote add origin https://github.com/infoanymo/midori-n8n.git
git push -u origin main
```

### 3. Renderでデプロイ
1. https://render.com にアクセス → GitHubアカウントでログイン
2. 「New +」→「Web Service」
3. `infoanymo/midori-n8n` を選択
4. 以下を設定：
   - Name: `midori-n8n`
   - Runtime: `Docker`
   - Instance Type: `Free`（無料プラン）
5. 環境変数を設定（Renderの「Environment」タブ）：
   ```
   N8N_BASIC_AUTH_ACTIVE = true
   N8N_BASIC_AUTH_USER   = admin
   N8N_BASIC_AUTH_PASSWORD = midori2026
   ```
6. 「Deploy」をクリック

### 4. デプロイ完了後
- n8n URL: `https://midori-n8n.onrender.com`（Renderが発行）
- ログイン: admin / midori2026

---

## n8nワークフロー設定

### ワークフローのインポート
1. n8n管理画面にログイン
2. 「Workflows」→「Import from File」
3. `n8n-workflow.json` をアップロード

### 変数（Variables）の設定
n8n管理画面の「Variables」で以下を設定：

| 変数名 | 値 |
|--------|-----|
| `GAS_WEBAPP_URL` | GASウェブアプリのURL（例: `https://script.google.com/macros/s/.../exec`） |
| `CHATWORK_API_TOKEN` | `d96758bc0e37c735992be923b71cc7aa` |

### Chatwork Webhook設定
1. n8nワークフローを有効化（Active: ON）
2. Webhook URLをコピー: `https://midori-n8n.onrender.com/webhook/chatwork-webhook`
3. Chatwork管理画面 → Webhook設定 → URLに貼り付け
4. イベント: 「メッセージ送信」にチェック

---

## GAS WebApp URL の取得方法
1. GASエディタを開く
2. 「デプロイ」→「新しいデプロイ」
3. 「ウェブアプリ」を選択
4. アクセス権: 「全員」
5. デプロイ → URLをコピー → n8nのVariablesに設定

---

## テスト手順
1. テスト用ChatworkルームID: `424893433`
2. 「タグ設置」と送信
3. みどりから逆質問が返ってくることを確認
4. 「テスト LY」と返信（アカウント管理シートにある商材名）
5. 依頼文プレビューが返ってくることを確認
6. 「承認」と返信
7. 指定のChatworkルームに依頼文が送信されることを確認

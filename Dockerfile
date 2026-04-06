FROM n8nio/n8n

# Renderのリバースプロキシ設定（HTTPSは外部で終端）
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV WEBHOOK_URL=https://midori-n8n.onrender.com

# タイムゾーン
ENV GENERIC_TIMEZONE=Asia/Tokyo
ENV TZ=Asia/Tokyo

# 暗号化キー（必須: 未設定だと起動失敗する場合がある）
ENV N8N_ENCRYPTION_KEY=midori-n8n-render-2026

# ユーザー管理を無効化（初回セットアップ画面をスキップ）
ENV N8N_USER_MANAGEMENT_DISABLED=true

# 不要な機能を無効化（起動を軽量化）
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false
ENV N8N_TEMPLATES_ENABLED=false

# データ保存先（Renderの書き込み可能ディレクトリ）
ENV N8N_USER_FOLDER=/tmp/n8n

# RenderはPORT環境変数でポートを指定する
CMD ["sh", "-c", "mkdir -p /tmp/n8n && export N8N_PORT=${PORT:-5678} && n8n start"]

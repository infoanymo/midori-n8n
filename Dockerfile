FROM n8nio/n8n

# Renderはリバースプロキシ経由でHTTPS終端するため、内部はhttpで動かす
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV GENERIC_TIMEZONE=Asia/Tokyo
ENV TZ=Asia/Tokyo
# Webhookの外部URLはhttpsで公開される
ENV WEBHOOK_URL=https://midori-n8n.onrender.com

# RenderはPORT環境変数でポートを指定する
CMD ["sh", "-c", "export N8N_PORT=${PORT:-5678} && n8n start"]

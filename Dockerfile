FROM n8nio/n8n

ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV WEBHOOK_URL=https://midori-n8n.onrender.com
ENV GENERIC_TIMEZONE=Asia/Tokyo
ENV TZ=Asia/Tokyo
ENV N8N_ENCRYPTION_KEY=midori-n8n-render-2026
ENV N8N_USER_MANAGEMENT_DISABLED=true
ENV N8N_DIAGNOSTICS_ENABLED=false
ENV N8N_VERSION_NOTIFICATIONS_ENABLED=false
ENV N8N_TEMPLATES_ENABLED=false

# n8nのデフォルトENTRYPOINT(tini + docker-entrypoint.sh)をクリアして
# シェル経由で起動することでRenderのPORT変数を正しくN8N_PORTに渡す
ENTRYPOINT []
CMD ["sh", "-c", "N8N_PORT=${PORT:-5678} n8n start"]

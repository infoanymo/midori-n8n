FROM n8nio/n8n

ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=https
ENV GENERIC_TIMEZONE=Asia/Tokyo
ENV TZ=Asia/Tokyo

# RenderはPORT環境変数でポートを指定する
# N8N_PORTにRenderのPORTを引き渡す
CMD ["sh", "-c", "N8N_PORT=${PORT:-5678} n8n start"]

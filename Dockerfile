FROM n8nio/n8n:latest

# Disable n8n personalization popups
ENV N8N_PERSONALIZATION_ENABLED=false

# Enable custom theme
ENV N8N_CUSTOM_THEME=true

# Copy your custom styles (we’ll add these next)
COPY ./custom /home/node/.n8n/custom

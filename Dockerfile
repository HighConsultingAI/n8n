FROM n8nio/n8n

# --- Branding for High Consulting AI ---
ENV N8N_PERSONALIZATION_ENABLED=false
ENV N8N_BRANDING_LOGO=https://i.imgur.com/Zi6msrW.png
ENV N8N_BRANDING_FAVICON=https://i.imgur.com/Zi6msrW.png
ENV N8N_BRANDING_COMPANY_NAME="High Consulting AI"
ENV N8N_BRANDING_APP_NAME="High Consulting AI Systems"
ENV N8N_BRANDING_THEME=dark
ENV N8N_BRANDING_DISABLED=false
ENV N8N_HIDE_USAGE_PAGE=true

# --- Optional performance & port settings ---
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
EXPOSE 5678

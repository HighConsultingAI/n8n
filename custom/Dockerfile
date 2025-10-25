FROM n8nio/n8n:latest

# Disable n8n personalization popups and enable custom theme
ENV N8N_PERSONALIZATION_ENABLED=false
ENV N8N_CUSTOM_THEME=true

# Create custom folder and copy your custom files
RUN mkdir -p /home/node/.n8n/custom
COPY custom /home/node/.n8n/custom

# Expose the default n8n port
EXPOSE 5678

# Start n8n (the base image's CMD works, but we specify explicitly)
CMD ["n8n", "start"]

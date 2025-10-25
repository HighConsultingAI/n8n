FROM n8nio/n8n:latest

# Disable personalization
ENV N8N_PERSONALIZATION_ENABLED=false
ENV N8N_CUSTOM_THEME=true

# Copy your custom assets
COPY custom /home/node/.n8n/custom

# Start n8n, but inject CSS at runtime
CMD n8n start & \
sleep 10 && \
echo '<style>' >> /home/node/.n8n/custom/inject.css && \
cat /home/node/.n8n/custom/styles.css >> /home/node/.n8n/custom/inject.css && \
echo '</style>' >> /home/node/.n8n/custom/inject.css && \
tail -f /home/node/.n8n/.n8n.log

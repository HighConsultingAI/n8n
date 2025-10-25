FROM n8nio/n8n:latest

# Copy your branding assets
COPY ./custom /home/node/.n8n/custom

# Disable personalization popup
ENV N8N_PERSONALIZATION_ENABLED=false
ENV NODE_ENV=production

# Start n8n, then inject your branding CSS dynamically
CMD n8n start & \
sleep 15 && \
echo '<style>' > /home/node/.n8n/custom/inject.css && \
cat /home/node/.n8n/custom/styles.css >> /home/node/.n8n/custom/inject.css && \
echo '</style>' >> /home/node/.n8n/custom/inject.css && \
echo '✅ Branding Injected Successfully' && \
tail -f /dev/null

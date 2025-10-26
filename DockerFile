# Use official n8n image
FROM n8nio/n8n:latest

# Copy your custom UI assets into the container
COPY ./custom /home/node/.n8n/custom

# Set environment variable so n8n loads custom styles
ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"

# Expose n8n default port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]

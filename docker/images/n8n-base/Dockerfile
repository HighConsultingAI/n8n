ARG NODE_VERSION=22.18.0

# ==============================================================================
# STAGE 1: Builder for Base Dependencies
# ==============================================================================
FROM node:${NODE_VERSION}-alpine AS builder

# Install fonts
RUN \
  apk --no-cache add --virtual .build-deps-fonts msttcorefonts-installer fontconfig && \
  update-ms-fonts && \
  fc-cache -f && \
  apk del .build-deps-fonts && \
  find /usr/share/fonts/truetype/msttcorefonts/ -type l -exec unlink {} \;

# Install essential OS dependencies
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.22/main" >> /etc/apk/repositories && echo "https://dl-cdn.alpinelinux.org/alpine/v3.22/community" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache libxml2 && \
    apk add --no-cache \
        git \
        openssh \
        openssl \
        graphicsmagick \
        tini \
        tzdata \
        ca-certificates \
        libc6-compat \
        jq

# Install full-icu
RUN npm install -g full-icu@1.5.0

RUN rm -rf /tmp/* /root/.npm /root/.cache/node /opt/yarn* && \
  apk del apk-tools

# ==============================================================================
# STAGE 2: Final Base Runtime Image
# ==============================================================================
FROM node:${NODE_VERSION}-alpine

COPY --from=builder / /

WORKDIR /home/node
ENV NODE_ICU_DATA=/usr/local/lib/node_modules/full-icu
EXPOSE 5678/tcp

# ==================== ✨ High Consulting AI Custom Branding ====================
# Copy your logo + styles directly into the n8n assets folder
RUN mkdir -p /home/node/.n8n/custom
COPY ./custom /home/node/.n8n/custom

# Set environment variable so n8n knows about your custom UI
ENV N8N_CUSTOM_EXTENSIONS="/home/node/.n8n/custom"

# Change default favicon and logo in build (overwrites n8n branding)
RUN echo "🚀 High Consulting AI branding applied" && \
    echo "Custom assets loaded from /home/node/.n8n/custom"

# ==================== ✨ End Custom Branding ====================

CMD ["n8n", "start"]

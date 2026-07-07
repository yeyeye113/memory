# Memory Static Site
FROM nginx:alpine
LABEL maintainer="yeyeye113"
LABEL description="Memory knowledge base static site"

# Copy memory files
COPY . /usr/share/nginx/html/

# Expose port
EXPOSE 80

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

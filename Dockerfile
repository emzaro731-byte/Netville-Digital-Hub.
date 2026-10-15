FROM nginx:alpine

# Serve the Netville Digital Hub static website with Nginx.
COPY index.html /usr/share/nginx/html/index.html

# Render routes incoming HTTP traffic to the service's assigned port.
RUN printf 'server {\n  listen 10000;\n  server_name _;\n  root /usr/share/nginx/html;\n  index index.html;\n  location / { try_files $uri $uri/ /index.html; }\n}\n' > /etc/nginx/conf.d/default.conf

EXPOSE 10000

CMD ["nginx", "-g", "daemon off;"]

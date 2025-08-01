#=====
# Most Debian-based base images
FROM node:21-slim

# Install curl
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY compile_page.sh /compile_page.sh
FROM node:21-slim

# Install curl
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY compile_page.sh /compile_page.sh
RUN chmod +x /compile_page.sh

WORKDIR /home/user/nextjs-app

# Use pnpm instead of npm for faster installation
RUN npm install -g pnpm

# Create Next.js app with pnpm (much faster)
RUN pnpm create next-app@15.3.3 . --yes

RUN pnpm dlx shadcn@2.6.3 init --yes -b neutral --force
RUN pnpm dlx shadcn@2.6.3 add --all --yes

RUN pnpm install

# Move files
RUN mv /home/user/nextjs-app/* /home/user/ && rm -rf /home/user/nextjs-app


# e2b template build --name vedant-lovable-test-1 --cmd "compile_page.sh"

# npm http fetch GET 200 https://registry.npmjs.org/colo
# => => # r-name 52ms (cache miss)
# => => # npm http fetch GET 200 https://registry.npmjs.org/is-a 
# => => # rrayish 85ms (cache miss)                              
# => => # npm verb reify failed optional dependency /home/user/n 
# => => # extjs-app/node_modules/@tailwindcss/oxide-wasm32-wasi
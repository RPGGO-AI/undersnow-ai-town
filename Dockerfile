# ENV APP_HOME /app
# WORKDIR $APP_HOME
# COPY . ./

# ENV PORT 8080

# RUN apt-get update && apt-get install -y nodejs


# CMD exec npm install

# CMD exec npm run build


# CMD exec npm start -- --port ${PORT}

FROM node:18

RUN npm i -g pm2 pnpm@8.6.10

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app


RUN pnpm install && pnpm build

WORKDIR /usr/src/app
EXPOSE 3000
CMD [ "pm2-runtime", "start", "scripts/ecosystem.config.js", "--env", "production"]

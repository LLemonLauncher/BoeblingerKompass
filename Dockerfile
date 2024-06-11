FROM flutter_sdk as frontend_build

WORKDIR /app

# frontend
RUN flutter channel stable
RUN flutter upgrade
RUN flutter config --enable-web

RUN git clone https://github.com/LLemonLauncher/BoeblingerKompass . \
&& flutter pub get \
&& flutter build web --release


# backend
FROM node:latest
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY --from=frontend_build /app/build/web ./client/

COPY . .

RUN npm run build

CMD [ "npm", "run", "start:dev" ]

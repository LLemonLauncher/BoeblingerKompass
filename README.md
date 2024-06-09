# Das Backend

Mit Docker starten:

```bash
sudo docker-compose up
```

Manuell starten:
```bash
# frontend setup
git clone https://github.com/LLemonLauncher/BoeblingerKompass -b main frontend
cd frontend

flutter pub get


# frontend compile
flutter build web --release

cd ..
mv frontend/build/web/* client


# backend
npm install

npm run start
```

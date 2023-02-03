# Flutter Barraginha

Um aplicativo para se calcular Barraginhas no Android.

## Chave do Google Maps

Quando for necessário adicionar ou trocar a chave do google maps, basta acessar o arquivo **AndroidManifest.xml** dentro da pasta **<raiz_do_projeto>/android/app/src/main** e dentro do arquivo identificar as seguintes linhas:

```xml
<meta-data 
    android:name="com.google.android.geo.API_KEY"
    android:value="API_KEY"/>
```

E no campo API_KEY, adicionar a chave do google maps. Para instruções de como obter uma chave do google maps, consulte [Google Maps Flutter](https://pub.dev/packages/google_maps_flutter)

## Compilar o Projeto

Para compilar o projeto, é necessário que o flutter esteja configurado na máquina (para saber mais, acesse [Flutter Install](https://docs.flutter.dev/get-started/install)) após instalado com exito, basta executar o comando abaixo e o APK será gerado;

```powershell
flutter build apk --release
```

Caso deseje apenas compilar o projeto para desenvolvimento, primeiro as depdências do projeto devem ser baixados com o comando abaixo:

```powershell
flutter pub get
```

E para executar o projeto, é necessário que o *Android Studio* esteja instalado e com pelo menos um emulador já pronto para uso.
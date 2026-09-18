# NextFlutter App

Application Flutter complète connectée à une véritable backend avec architecture propre.

## Architecture

Ce projet suit l'architecture **Clean Architecture** avec trois couches :

- **domain** : Entités et cas d'usage (use cases) de l'application
- **data** : Répositories, sources de données (remote + local) et modèles
- **presentation** : Fournisseurs (Providers) et écrans UI

### Couche Domain (`lib/domain/`)
- **Entities** : Modèles de données pures (`MovieEntity`)
- **Use Cases** : Cas d'usage qui contiennent la logique métier
  - `GetPopularMovies` - Récupère les films populaires
  - `GetMovieDetails` - Récupère les détails d'un film
  - `UserLogin` - Connexion utilisateur
  - `UserRegister` - Inscription utilisateur
  - `UserLogout` - Déconnexion utilisateur
  - `CheckAuthStatus` - Vérifie l'état d'authentification

### Couche Data (`lib/data/`)
- **Repositories** : Abstraction entre la couche présentation et données
  - `MovieRepository` - Interface pour les données movies
  - `AuthRepository` - Interface pour les données d'authentification
- **Datasources** : Sources de données concrètes
  - `MovieRemoteDatasource` - API calls via Dio (`/movie/popular`)
  - `AuthRemoteDatasource` - Authentification via API (`/auth/login`, `/auth/register`)
  - `AuthLocalDatasource` - Stockage local avec Hive
  - `HiveAuthDatasource` - Wrapper Hive implémentant AuthDatasource
- **Models** : Modèles de données avec conversion JSON
  - `MovieModel` - Modèle pour les données movies
  - `AuthCredentialsModel` - Modèle credentials login/register

### Couche Presentation (`lib/presentation/`)
- **Providers** : Gestion d'état avec `ChangeNotifier` + `Provider`
  - `AuthProvider` - Gère l'état d'authentification, token, login/logout
  - `MovieProvider` - Gère la liste des films avec chargement asynchrone
- **Screens** : Interfaces utilisateur
  - `LoginScreen` - Formulaire de connexion avec validation
  - `RegisterScreen` - Formulaire d'inscription
  - `HomeScreen` - Écran principal avec grille de films

## API Utilisée

- **Movie API** : Point d'extrémité `/movie/popular` pour récupérer les films populaires
- **Auth API** : Points d'extrémité `/auth/login`, `/auth/register`, `/auth/me`, `/auth/logout`
- Toutes les réponses sont au format JSON

## Configuration du projet

### Prérequis

- Flutter SDK (version 3.47.2 ou supérieure)
- Dart SDK (version 3.13.2 ou supérieure)

### Étapes d'installation

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/JTECH07/nextflutter_app.git
   cd nextflutter_app
   ```

2. **Installer les dépendances**
   ```bash
   flutter pub get
   ```

3. **Configuration Hive (stockage local)**
   Le projet utilise Hive pour le stockage local des tokens d'authentification. Aucune configuration supplémentaire n'est requise - Hive est initialisé automatiquement au démarrage.

4. **Lancer l'application**
   ```bash
   flutter run
   ```

   ou pour le web :
   ```bash
   flutter build web
   ```

### Structure des dépendances

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  
  # API et networking
  dio: ^5.4.0
  connectivity_plus: ^6.0.3
  
  # Local caching
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # State management
  provider: ^6.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  
  # Build runners pour Hive
  build_runner: ^2.4.8
  hive_generator: ^2.0.1
  
  lint: ^2.1.0
  flutter_lints: ^6.0.0
```

## Fonctionnalités

- **Authentification** : Connexion/inscription/déconnexion avec gestion de token JWT
- **Mode hors ligne** : Affichage des données mises en cache lorsque le réseau est indisponible
- **Mise en cache locale** : Stockage des tokens avec Hive
- **Gestion d'erreurs** : Messages utilisateur pour les échecs réseau
- **3 écrans** : Login, Register, Home avec grille de films
- **Architecture propre** : Ségrégation des préoccupations (domain/data/presentation)

## Plateformes supportées

- Android
- iOS
- Web
- Linux
- macOS
- Windows

## Contact

Projet créé dans le cadre de la validation des compétences en API, architecture et persistance.
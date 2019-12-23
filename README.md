# Projet Application mobile 4A
Ce fichier contient les information relative au projet mobile de 4eme année. 
Cette application est une interface graphique pour l'api The Movie Database qui permet d'acceder a des listes de films, de rechercher des films et enfin d'enregistrer des film a voir sur une base de donnée firebase.



## Spécificités techniques

- Flutter 
- Firebase Authentification
- Cloud Firestore
- Firestore CRUD
- Consomation d'api REST (https://developers.themoviedb.org/)
- Barre de recherche 
- Future Promise Await Async
- Wrapper 
- Bottom Navigation Bar 
- KISS architecture
- Geometric Vector UI
- Application Wrapper 
- GitFlow

## Présentation

### Sign In

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114010_com.etienneesiea4amobile.movies.jpg?raw=true)


Cette page permet de se connecter soit avec des identifiants déjà enregistrés soit en tant qu'invité. 
Le champ e-mail nécessite une adresse e-mail sémantiquement correct 
Le champ password nécessite un mot de passe correct

Les informations sont vérifiées à l'aide du système d'authentification de Firebase.

Une fois l'utilisateur connecté, le Wrapper permet de visualiser l'application.

### Register

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114133_com.etienneesiea4amobile.movies.jpg?raw=true)


Cette page permet de se s'enregistrer.

Le champ e-mail nécessite une adresse e-mail sémantiquement correct et libre dans la base 
Le champ password nécessite un mot de passe de plus de 6 caractères.

Les informations sont vérifiées à l'aide du système d'authentification de Firebase.
Une fois l'utilisateur enregistré, le Wrapper permet de visualiser l'application.

### Listes

L'application permet de se deconnecter et de naviguer entre les differents onglets

- Now playing affiche les film actuellement en salle

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114153_com.etienneesiea4amobile.movies.jpg?raw=true)

- Top rated affiche les film les mieux noté de l'histoire

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114201_com.etienneesiea4amobile.movies.jpg?raw=true)

- Up comming affiche les films prochainement en salle

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114209_com.etienneesiea4amobile.movies.jpg)

Chaque cellule de film est interactive. Au touché d'une image, une description détaillée du film apparaît

Avec l'image, la description complète, la note et un bouton permettant d'ajouter le film à sa liste de films à voir.

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114223_com.etienneesiea4amobile.movies.jpg)


### My Movies

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114234_com.etienneesiea4amobile.movies.jpg?raw=true)

My movies récupère les films enregistrer sur Firebase. Chaque liste est propre à chaque utilisateur. L'icône œil permet de marquer le film comme vu et de le supprimer de la liste.

La suppression et l'ajout sont automatiques et la vue est mise à jour en temps réel,grâce a firestore.

### Search Movies

![](https://github.com/etienneamiche/movies/blob/master/Screenshot_20191223_114250_com.etienneesiea4amobile.movies.jpg?raw=true)

Search movie permet de requêter l'api de recherche de TMDB

Cette vue affiche une liste similaire aux trois premières listes et permet de visualiser les détails du film et de l'ajouter à sa liste de films à voir.

## Architecture du code Flutter 
Les fichier .dart sont dans le dossier lib

```
│   main.dart
│
├───models
│       movie.dart
│       user.dart
│
├───services
│       auth.dart
│       database.dart 
│       tmdb.dart
│                                                                                                                       
├───ui
│       background.dart
│
└───views
│       └──────wrapper.dart     
|       ├──────authenticate  
│                     authenticate.dart
│                     register.dart  
│                     sign_in.dart  
│              
|       ├──────home         
|                     home_page.dart   
│             
|       ├──────movie         
|                     list_title.dart
|                     movie_cell.dart   
|                     movie_detail.dart
|                     movie_list.dart
|                     my_movie_list.dart 
|                     search_movie.dart                                                                                                       

```
## Resources & Inspirations
### Firebase Authhentication & App Architecture 
https://github.com/iamshaunjp/flutter-firebase

### UI Background 
https://github.com/SubirZ/Awesome_Flutter_UI

### Movie List
https://github.com/aj019/Flutter-Movie-List-App

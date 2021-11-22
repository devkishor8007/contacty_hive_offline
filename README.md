# Hive Contact App in Flutter

Using Hive to store the data as a Offline, make a contact app and also change the theme.
Hive is a lightweight and blazing fast key-value database written in pure Dart.

## Getting Started

### Before clone the repo, you must have flutter on your device.
 
    Fork this repo 
    $ git clone https://github.com/<username_github>/contacty_hive_offline


### Remember to update all the packages...
    $ flutter clean
    $ flutter pub get
    
### Run the app
    f5 or click on RUN

##

### Pacakge That I use in this project
    hive
    hive_flutter
    path_provider
    build_runner
    hive_generator

### Usage

#### You can use Hive just like a map. It is not necessary to await Futures.

    var box = Hive.box('myBox');

    box.put('name', 'David');

    var name = box.get('name');

    print('Name: $name');
    
## Hive Contact App Final Output

<p float="left">
<img src="https://user-images.githubusercontent.com/73419211/142890263-f40e4289-2d07-4d6a-a797-d37e0f8804b6.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142890313-46ef018c-6dc8-4b4a-8bf7-1be255702f8c.jpg" height="500" width="270"> 
<img src="https://user-images.githubusercontent.com/73419211/142890310-a9125d5d-fb4a-4c18-ac38-45d578d92ba1.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142890279-faab272b-5e80-47b5-b52b-0a66c424ffb7.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142890325-1c7b9776-069c-4179-81a4-691d6fd9353d.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142890331-354e38c3-00db-4fff-960d-d1692ba6fdcf.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142891429-fd5221d0-19e5-47ca-8c88-05cd66125b99.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142891421-84bf7ac3-2fb6-44e5-af26-8b667a1bb285.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142891442-b91cfd82-1451-45ab-995d-45a61e2c2684.jpg" height="500" width="270">
<img src="https://user-images.githubusercontent.com/73419211/142891439-da094f02-9871-4d4a-ae18-8b965e1ae209.jpg" height="500" width="270">
</p>


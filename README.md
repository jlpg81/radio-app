# radio-app

How to run:
Clone
In terminal: flutter pub get
Open emulator and press ctrl+f5.

Works with android emulators, not for iOS.

Backend API used:
Bando Radio API: https://rapidapi.com/serhaterfidan/api/bando-radio-api

Available countries:
Germany
Spain
France
Vietnam

Some notes:

The api call is kept there even if it is not used. It works as expected, but considering queries are very limited in number, and the hassle of puting the key securely in github, I instead opted to make a json file with 50 radio stations from 4 countries.

Many stations do not work. This is due to the api having outdated information. Other apis would give more correct data but would be prohibitively expensive.

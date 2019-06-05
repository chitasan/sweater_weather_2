# Sweater Weather

 Sweater Weather is a solo project that was created with Ruby on Rails to consume the following APIs: 

   - [Dark Sky API](https://darksky.net/dev), 
   - [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/start), 
   - [Flickr API](https://www.flickr.com/services/api/)
   - [Fast JSON:API](https://github.com/Netflix/fast_jsonapi)
 
Try the API in production on [Heroku](https://fierce-meadow-77109.herokuapp.com/)

The project spec can be found [here](http://backend.turing.io/module3/projects/sweater_weather).

## Setup & Installation 

Clone the repository [here](https://github.com/chitasan/sweater_weather).
```
$ bundle install
```
```
$ rake db:{create,migrate}
```
## Testing	

Set up Environment Variables

Sign up for API Keys: 
  - [Dark Sky API](https://darksky.net/dev) 
  - [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/start) 
  - [Flickr API](https://www.flickr.com/services/api/) 


 * Deployment instructions	  Run the following command to install `figaro`:
  ```
  figaro install
  ```
  In `config/application.yml`, copy and paste the following, and enter your API keys. 
 ```
DARKSKY_API_KEY: 
GOOGLE_API_KEY: 
FLICKR_API_KEY: 
AMYPODE_API_KEY: 
  ```
To test, run: 
```
$ rspec
```

## Endpoints to Call

### Retrieving weather forecast for a location: 
The following endpoint gets the location's latitude and longitude using the Google Geocoding API, and returns the weather using Dark Sky API.
```
GET /api/v1/forecast?location=denver,co
```
### Creating a user: 
The following endpoint gets the appropriate data in the request body and creates a new user with an API key for user. 
```
POST /api/v1/users
```
### Logging in a user: 
The following endpoint logs a user in. 
```
POST /api/v1/sessions
```
### Favoriting a location: 
Logged in and authenticated user with valid API key can create a favorite location with the following endpoint. 
```
POST /api/v1/favorites
```
The favorite locations gets returned with the following endpoint. 
```
GET /api/v1/favorites
```
 ## Built With:
* [Ruby 2.4.1](https://ruby-doc.org/core-2.4.1/)
* [Rails 5.2.3](https://guides.rubyonrails.org/)
* [Fast JSON:API](https://github.com/Netflix/fast_jsonapi)
* [Faraday](https://github.com/lostisland/faraday)
* [Capybara](https://github.com/teamcapybara/capybara/blob/3.12_stable/README.md)
* [vcr](https://github.com/vcr/vcr)
* [RSpec](http://rspec.info/)
* [Heroku](https://www.heroku.com/)


 ## Author
**[Chi Tran](https://github.com/chitasan)**

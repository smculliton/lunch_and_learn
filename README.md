# README

## Table of Contents
* [General Info](#general-info)
* [Learning Goals](#learning-goals)
* [Database Design](#database-design)
* [Technologies](#technologies)
* [Usage](#usage)
* [API Endpoints](#api-endpoints)

## General Info
Lunch and Learn is the API for an app that allows you to learn about a country while also suggesting recipes to try from that country's cuisine. This project was made as part of the requirements to pass Mod 3 at [Turing School of Software and Design](https://turing.edu/)

The API can be found deployed at ``https://lunch-and-learn-be.herokuapp.com/``


## Learning Goals
- Expose an API that aggregates data from four different external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure while mocking requests to save on expensive API calls

## Database Design

![Lunch and Learn Schema](https://user-images.githubusercontent.com/108320490/219519718-4dc023d9-740e-4c3e-9051-bbfcc072e910.png)


## Technologies
- Ruby 2.7.4
- Rails 5.2.8

## Usage

Clone the repo by running `git clone` with the copied URL onto your local machine

Then, run the following commands:
```
cd lunch_and_learn
bundle install
rails db:{drop,create,migrate}
rails s
```

Lastly, head to your web browser or Postman. The base URL is `localhost:3000` and endpoints are listed below.

## API Endpoints

<details close>
<summary>GET /api/v1/recipes</summary
  > get recipes from a specified or random country
  
  | Path Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | country      | string | Optional |
  
  Example Response:
  ```
  {"data"=> 
    [
      { 
        "id"=>null,
        "type"=>"recipe", 
        "attributes"=> { 
          "title"=>"Sean's Special Surprise Cake",
          "url"=>"<recipe url>", 
          "country"=>"thailand",  
          "image"=>"<image url>" 
        }
      },
      {
        "id"=>null,
        "type"=>"recipe", 
        "attributes"=> { 
          "title"=>"Curry Burgers",
          "url"=>"<recipe url>", 
          "country"=>"thailand",  
          "image"=>"<image url>" 
        }
      },
      {etc.}
    ]
  }
  ```
<br> 
</details>

<details close>
  <summary>GET /api/v1/learning_resources</summary>
  > get learning resources for a specified country 
  
  | Path Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | country      | string | Required |
  
  Example Response:
  ```
  {
      "data": {
          "id": null,
          "type": "learning_resource",
          "attributes": {
              "country": "laos",
              "video": {
                  "title": "A Super Quick History of Laos",
                  "youtube_video_id": "uw8hjVqxMXw"
              },
              "images": [
                  {
                      "alt_tag": "standing statue and temples landmark during daytime",
                      "url": "<image url>"
                  },
                  {etc.}
              ]
          }
      }

  }
  ```
<br> 
  </details>

  <details close>
    <summary>POST /api/v1/users</summary>
  > registers a new user and returns api key 
  
  Request Body JSON Example: 
  ```
  {
    "name": "Athena Dao",
    "email": "athenadao@bestgirlever.com"
  }
  ```
  
  Example Reponse:
  ```
  {
    "data": {
      "type": "user",
      "id": "1",
      "attributes": {
        "name": "Athena Dao",
        "email": "athenadao@bestgirlever.com",
        "api_key": "<api key>"
      }
    }
  }
  ```
<br> 
</details>
    
 <details close>
 <summary>POST /api/v1/favorites</summary>
  > add a favorite recipe to a registered user
  
  Request Body JSON Example: 
  ```
  {
      "api_key": "<user api key>",
      "country": "thailand",
      "recipe_link": "https://www.tastingtable.com/.....",
      "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
  }
  ```
  
  Example Reponse:
  ```
  {
      "success": "Favorite added successfully"
  }
  ```
<br>
      </details>
      <details close>
        <summary>GET /api/v1/favorites</summary>
  > get all of a user's favorite recipes

  | Path Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | api_key      | string | Required |

  
  Example Reponse:
  ```
  {
      "data": [
          {
              "id": "1",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Recipe: Egyptian Tomato Soup",
                  "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                  "country": "egypt",
                  "created_at": "2022-11-02T02:17:54.111Z"
              }
          },
          {
              "id": "2",
              "type": "favorite",
              "attributes": {
                  "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                  "recipe_link": "https://www.tastingtable.com/.....",
                  "country": "thailand",
                  "created_at": "2022-11-07T03:44:08.917Z"
              }
          }
      ]
  }
  ```
<br>
</details>

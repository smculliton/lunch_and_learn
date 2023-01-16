
## Get Recipes For a Particular Country
* Testing should look for more than just the presence of attribute fields in the response. Testing should also determine which fields should NOT be present. (don’t send back unnecessary data in the response)

## Register User
* make sure API key for users is unique

## Add Favorites
* test edge case if other params are missing

# README

## Table of Contents
* [General Info](#general-info)
* [Learning Goals](#learning-goals)
* [Database Design](#database-design)
* [Technologies](#technologies)
* [Usage](#usage)
* [API Endpoints](#api-endpoints)

## General Info
README for Lunch and Learn app backend. Exposes endpoints to provide recipes, learning resources, and user data for front end consumption.

## Learning Goals
- Expose an API that aggregates data from multiple external APIs
- Expose an API that requires an authentication token
- Expose an API for CRUD functionality
- Determine completion criteria based on the needs of other developers
- Test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc)

## Database Design

Pending

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
- ### GET /api/v1/recipes
  > get recipes from a specified or random country
  
  | Path Parameter        | Type          |  |
  | ------------- |:-------------:| -----:|
  | country      | string | Optional |
  
  Example:
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
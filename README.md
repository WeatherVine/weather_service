# Weather Vine Weather Microservice

## About this Project
Weather Vine is an educational app for consumers to connect more deeply with the wine they enjoy. Explore wines from a region and see how the climate has influenced the very wine one drinks!   

## Table of Contents

- [Getting Started](#getting-started)
- [Running the tests](#running-the-tests)
- [Service Oriented Architecture](#service-oriented-architecture)
- [Other Repos](#other-repos)
- [Built With](#built-with)
- [Contributing](#contributing)
- [Versioning](#versioning)
- [Authors](#authors)
- [Acknowledgments](#acknowledgments)

## Getting Started

To get the web application running, please fork and clone down the repo.


`git clone <your@github.account:WeatherVine/front_end.git>`

### Prerequisites

To run this application you will need Ruby 2.5.3 and Rails 5.2.5

### Installing

- Install the gem packages  
  - `bundle install`
- Generate your local `application.yml` file to store the api key and confirm it was added to your `.gitignore`
  - `bundle exec figaro install`

## Running the tests
RSpec testing suite is utilized for testing this application.
- Run the RSpec suite to ensure everything is passing as expected  
`bundle exec rspec`

## Service Oriented Architecture
![](assets/README-d472bc6e.png)
- The purpose of this microservice is to facilitate the communication between our Weather Vine back-end application and the Weather API that we are consuming by filtering the response as needed.

## Other Repos
- Weather Vine Front-End Application
  - [Repo](https://github.com/WeatherVine/front_end) | [Heroku](https://weathervine-fe.herokuapp.com/)
- Weather Vine Back-End Application
  - [Repo](https://github.com/WeatherVine/back_end) | [Heroku](https://weathervine-be.herokuapp.com/)
- Weather Vine Wine Microservice
  - [Repo](https://github.com/WeatherVine/wine_service) | [Heroku](https://wine-service-sinatra.herokuapp.com/)

## Endpoints

##### Climate Data
- **Required** query params:
  - `vintage`
  - `region`

`GET https://weather-service-sinatra.herokuapp.com/api/v1/climate_data?vintage={year}&region={region}`

```json
{data: {
    "id": #{id},
    "type": "climate",
    "attributes": {
      "temp": #{temp(integer)},
      "precip": #{precip(integer)},
      "vintage": #{vintage(integer)},
      "region": #{region(string)}
    }
  }
}
```
## Built With
- [Sinatra](https://github.com/sinatra/sinatra)
- [Ruby](https://www.ruby-lang.org/en/)
- [RSpec](https://github.com/rspec/rspec)
- [Rbenv](https://github.com/rbenv/rbenv)

## Contributing
Please follow the steps below and know that all contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/<New-Cool-Feature-Name>`)
3. Commit your Changes (`git commit -m 'Add <New-Cool-Feature-Name>'`)
4. Push to the Branch (`git push origin feature/<New-Cool-Feature-Name>`)
5. Open a Pull Request

## Versioning
- Sinatra 2.1.0
- Ruby 2.5.3
- RSpec 3.10.0
- Rbev 1.1.2

## Authors
- **Adam Bowers**
| [GitHub](https://github.com/Pragmaticpraxis37) |
  [LinkedIn](https://www.linkedin.com/in/adam-bowers-06a871209/)
- **Alex Schwartz**
| [GitHub](https://github.com/aschwartz1) |
  [LinkedIn](https://www.linkedin.com/in/alex-s-77659758/)
- **Diana Buffone**
| [GitHub](https://github.com/Diana20920) |
  [LinkedIn](https://www.linkedin.com/in/dianabuffone/)
- **Katy La Tour**
| [GitHub](https://github.com/klatour324) |
  [LinkedIn](https://www.linkedin.com/in/klatour324/)
- **Tommy Nieuwenhuis**
|  [GitHub](https://github.com/tsnieuwen) |
    [LinkedIn](https://www.linkedin.com/in/thomasnieuwenhuis/)
- **Trevor Suter**
|    [GitHub](https://github.com/trevorsuter) |
    [LinkedIn](https://www.linkedin.com/in/trevor-suter-216207203/)
- **Wil McCauley**
|    [GitHub](https://github.com/wil-mcc) |
    [LinkedIn](https://www.linkedin.com/in/wil-mccauley/)

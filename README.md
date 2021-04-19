# weather_service

## Endpoints

#### Climate Data
**Required** query params:
- `vintage`
- `region`
**GET https://weather-service-sinatra.herokuapp.com/api/v1/climate_data?vintage={year}&region={region}**

`{data: {
    "id": #{id},
    "type": "climate",
    "attributes": {
      "temp": #{temp(integer)},
      "precip": #{precip(integer)},
      "vintage": #{vintage(integer)},
      "region": #{region(string)}
    }
  }
}`


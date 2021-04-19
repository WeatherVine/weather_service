# weather_service

## Endpoints

### Climate Data
**Required** query params:

- `vintage` 
- `region`

**GET https://weather-service-sinatra.herokuapp.com/api/v1/climate_data?vintage={year}&region={region}**

`{data: {<br>
    "id": #{id},<br>
    "type": "climate",<br>
    "attributes": {<br>
      "temp": #{temp(integer)},<br>
      "precip": #{precip(integer)},<br>
      "vintage": #{vintage(integer)},<br>
      "region": #{region(string)}<br>
    }<br>
  }<br>
}`


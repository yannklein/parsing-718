require 'json'

# TODO - let's read/write data from beers.json
filepath    = 'data/beers.json'

serialized_data = File.read(filepath)
# p serialized_data
# p serialized_data.class
data = JSON.parse(serialized_data)
# p data.class
# p data

beers = { 
  beers: [
    {
      name:       'Edelweiss',
      appearance: 'White',
      origin:     'Austria'
    },
    {
      name:       'Guinness',
      appearance: 'Stout',
      origin:     'Ireland'
    }
  ]
}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
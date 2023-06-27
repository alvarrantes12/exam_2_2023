json.array! @countries do |country|
  json.id country.id
  json.name country.name
  json.fact country.fact
end

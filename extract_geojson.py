import pygeoj

cards = pygeoj.load(filepath="grid_cartas_planet_corrected_V2.geojson")

for card in cards:
	card_name = card.properties.get("name")
	geojson = pygeoj.new()
	geojson.add_feature(card)
	geojson.save("cards/" + card_name + ".geojson")
def build_nested_structure
	michaels_store = {
		adhesives: ["School glue", "Krazy glue", "Fabric glue", "Spray adhesives"],
		baking: ["Cake decorating", "Candy making", "Bakeware"],
		floral: ["Floral stems", "Glass", "Floral accessories", "Naturals", "Greenery"],
		fine_arts: {
			drawing: ["Markers", "Pencils", "Pastels", "Erasers"],
			painting: ["Acrylic paint", "Oil paint", "Watercolor paint", "Paint brushes", "Easels", "Palettes"],
			surfaces: ["Canvases", "Boards", "Surface pads"]
		},
		framing: ["Home frames", "Poster frames", "Shadowboxes", "Frame easels", "Hanging supplies"],
		jewelry: ["Strung beads", "Stringing", "Tools", "Beads", "Storage"],
		kids: {
			crayola: ["Crayons", "Color pencils", "Clay", "Paper", "Paint"],
			toys: ["Model cars", "Model planes", "Model boats", "Dolls", "Impulse buys"],
			general_crafts: ["Felt", "Foam", "Wood", "Glitter"]
		},
		scrapbooking: ["Paper", "Albums", "Mixed media", "Stickers"],
		wedding: ["Cake toppers", "Decor", "Party favors", "Glassware", "Silverware"],
		wood: ["Wooden boxes", "Birdhouses", "Clockmaking/Plaques", "Wooden Letters"],
		yarn: ["Yarn", "Thread", "Embroidery", "Sewing tools", "Yarn accessories"]
	}
	michaels_store
end

michaels_store = build_nested_structure
puts "Expected: Spray adhesives"
puts "Output: " + michaels_store[:adhesives].last
puts "Expected: Candy making"
puts "Output: " + michaels_store[:baking][1]
puts "Expected: Palettes"
puts "Output: " + michaels_store[:fine_arts][:painting].last
puts "Expected: Canvases"
puts "Output: " + michaels_store[:fine_arts][:surfaces][0]
puts 'Expected: ["Felt", "Foam", "Wood", "Glitter"]'
puts "Output: " + michaels_store[:kids][:general_crafts][0..3].to_s
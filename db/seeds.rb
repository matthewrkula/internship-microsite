urls = [
	"http://unioncitytm.files.wordpress.com/2011/07/best-price-vacation.jpg",
	"http://www.1stwebdesigner.com/wp-content/uploads/2009/04/apophysis/Abalone_inspiration.jpg",
	"http://xemanh.net/images/art/kagaia/Inspiration.jpg",
	"http://traveldealsnetwork.com/wp-content/uploads/2011/06/vacation-in-mexico1.jpg",
	"http://4.bp.blogspot.com/_U2iOrvm-mB8/S7xxoWSIaaI/AAAAAAAAADI/cVbvmX_Zrh0/s1600/inspiration.jpg",
	"http://www.houstonproperties.com/images/houston-downtown-night.jpg",
	"http://cache.marriott.com/propertyimages/f/fwadt/fwadt_home01.jpg",
	"http://webpage.pace.edu/jw56168n/images/NYC2.jpg",
	"http://www.marietta.edu/~biol/biomes/images/alpine/olympic_5946.jpg",
	"http://collectionphotos.com/wp-content/uploads/2013/04/rocky-mountains-mural.jpg",
	"http://media-cdn.tripadvisor.com/media/photo-s/01/c3/16/a6/amazing-view-bed-breakfast.jpg",
	"http://media-cdn.tripadvisor.com/media/photo-s/01/bd/96/f5/bald-mountain.jpg"
]

100.times do |i|
	Thought.create({
		text: "This is thought number #{i}. This is so embarassing", 
		link: urls[rand(urls.length)]})
end

# colors = "blue, green, orange, pink, purple, yellow"

# Thought.create({
# text: "First one!!!",
# 	link: "/assets/LARGE-IMG-NAME.jpg",
# 	small_link: "/assets/SMALL-IMG-NAME.jpg",
# 	color: "COLOR"
# })
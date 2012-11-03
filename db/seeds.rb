# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Business.destroy_all
Coupon.destroy_all

businesses = [{ name: "Starbucks Coffee", place: "152191971504323" },
						{ name: "Univeristy of Urbana-Champaign", place:"163536409904"},
						{ name: "1871", place: "234789319939052"}]

coupons = [	{ desc: "A free coffe at 1871!",
							code: "A8919876",
							discount: 100,
							business_id: 3},

						{ desc: "A good old Starbuck cofee for free!",
							code: "A981365G",
							discount: 100,
							business_id: 1},

						{ desc: "Two muffins for the price of one!",
							code: "A981V781",
							discount: 100,
							business_id: 2},

						{ desc: "Get a free pumpkin latte with a muffin!",
							code: "A98CC123",
							discount: 50,
							business_id: 1 },

						{ desc: "50% on your first co-working month at 1871!",
							code: "A98CC193",
							discount: 50,
							business_id: 3 },

						{ desc: "50% on your tuition fees!",
							code: "A98CC193",
							discount: 50,
							business_id: 2 }]

Business.create businesses
Coupon.create coupons
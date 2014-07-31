class Car
	@@total_car_count = 0
	@@cars_per_color = {}

	#Class method example (Note the self.method_name)
	def self.total_car_count
		@@total_car_count
	end

	def to_s()
		"I'm a #{@color} car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	#Finds the color car with the most instances (if there is a tie it just returns the first one)
	def self.most_popular_color
		highest_number_of_cars = 0
		most_popular_color = ""

		@@cars_per_color.each do |color, number|
			puts "#{color} : #{number}"
			if number > highest_number_of_cars
				highest_number_of_cars = number
				most_popular_color = color
			end
		end

		most_popular_color
	end

	#Updated initialize method 
	def initialize(color)
		@color = color
		@fuel = 10
		@distance = 0
		
		if @@cars_per_color.key?(color)
			count = @@cars_per_color[color]
			@@cars_per_color[color] = count + 1
		else
			@@cars_per_color[color] = 1
		end
	end


	#Change the car color and updates the @@car_per_color hash
	def color=(color)
		#subtract one from the old color's count
		old_count = @@cars_per_color[@color]
		@@cars_per_color[@color] = old_count - 1

		#update the car color 
		@color = color
		if @@cars_per_color.key?(@color)
			count = @@cars_per_color[@color]
			@@cars_per_color[@color] = count + 1
		else
			@@cars_per_color[@color] = 1
		end
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

#I left out the convertible instance variable since a ConvertibleCar is already a convertible.
class ConvertibleCar < Car

	attr_accessor :roof_status
	def initialize(color)
		super(color)
		@roof_status = "closed"
	end

	def top_down
		roof_status = "open"
	end

	def close_top
		roof_status = "closed"
	end

end

car_a = Car.new("red")
car_b = Car.new("blue")
car_c = Car.new("red")
puts car_a
puts car_b
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts car_a
puts car_b



########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
#     The layers I identified are as follows: ALL_RIDES, DRIVER_ID, and RIDE_DATA (which consists of DATE, COST, RIDER_ID, RATING)**
#     ** NOTE: RIDE_DATA is not an actual variable name that I use in my data structure.

# Which layers are nested in each other?
#     Many RIDE_DATA are nested in DRIVER_ID. Many DRIVER_IDs are nested in ALL_RIDES.

# Which layers of data "have" within it a different layer?
#     The layers that have a different layer within it are: ALL_RIDES and DRIVER_ID.
#     ALL_RIDES has many DRIVER_IDs within it.
#     DRIVER_ID has many RIDE_DATA within it.

# Which layers are "next" to each other?
#     RIDE_DATA (DATE, COST, RIDER_ID, RATING) are next to each other because they are stored within the same hash.


########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
#     ALL_RIDES is a hash.
#     DRIVER_ID is a key in ALL_RIDES
#     RIDE_DATA is the value in ALL_RIDES. RIDE_DATA is an array of hashes.

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

all_rides = {
    DR0001: [
        {
            date: '3rd Feb 2016',
            cost: 10,
            rider_id: 'RD0003',
            rating: 3
        },
        {
            date: '3rd Feb 2016',
            cost: 30,
            rider_id: 'RD0015',
            rating: 4
        },
        {
            date: '5th Feb 2016',
            cost: 45,
            rider_id: 'RD0003',
            rating: 2
        }
    ],
    DR0002: [
        {
            date: '3rd Feb 2016',
            cost: 25,
            rider_id: 'RD0073',
            rating: 5
        },
        {
            date: '4th Feb 2016',
            cost: 15,
            rider_id: 'RD0013',
            rating: 1
        },
        {
            date: '5th Feb 2016',
            cost: 35,
            rider_id: 'RD0066',
            rating: 3
        }
    ],
    DR0003: [
        {
            date: '4th Feb 2016',
            cost: 5,
            rider_id: 'RD0066',
            rating: 5
        },
        {
            date: '5th Feb 2016',
            cost: 50,
            rider_id: 'RD0003',
            rating: 2
        }
    ],
    DR0004: [
        {
            date: '3rd Feb 2016',
            cost: 5,
            rider_id: 'RD0022',
            rating: 5
        },
        {
            date: '4th Feb 2016',
            cost: 10,
            rider_id: 'RD0022',
            rating: 4
        },
        {
            date: '5th Feb 2016',
            cost: 20,
            rider_id: 'RD0073',
            rating: 5
        }
    ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given

def total_rides_per_driver(all_rides)
  return all_rides.map do |driver_id, rides|
    { :driver_id => driver_id, :total_rides => rides.length }
  end
end

total_rides_per_driver(all_rides).each do |all_drivers_rides|
  puts "#{all_drivers_rides[:driver_id]} gave #{all_drivers_rides[:total_rides]} total rides."
end

# - the total amount of money each driver has made

def total_income_per_driver(all_rides)
  all_drivers_income = {}

  all_rides.each do |driver_id, rides|
    income = 0
    rides.each do |ride_data|
      income += ride_data[:cost]
    end
    all_drivers_income[driver_id] = income
  end

  return all_drivers_income
end

total_income_per_driver(all_rides).each do |driver_id, income|
  puts "#{driver_id}'s total income: $#{'%.2f' % income}"
end

# - the average rating for each driver

def drivers_average_rating(all_rides)
  driver_ratings = {}

  all_rides.each do |driver_id, rides|
    sum = 0

    rides.each do |ride_data|
      sum += ride_data[:rating]
    end
    driver_ratings[driver_id] = sum.to_f / rides.length
  end

  return driver_ratings
end

drivers_average_rating(all_rides).each do |driver_id, rating|
  puts "#{driver_id}'s average rating: #{rating.round(2)}"
end

# - Which driver made the most money?

def driver_with_highest_income(all_rides)
  all_income = total_income_per_driver(all_rides)
  highest_income = all_income.values.max
  driver = all_income.key(highest_income)
  puts "#{driver} made the most money, earning $#{'%.2f' % highest_income}"
end

driver_with_highest_income(all_rides)

# - Which driver has the highest average rating?

def highest_average_rating(all_rides)
  all_ratings = drivers_average_rating(all_rides)
  highest_rating = all_ratings.values.max
  driver = all_ratings.key(highest_rating)
  puts "#{driver} has the highest average rating: #{highest_rating.round(2)}"
end

highest_average_rating(all_rides)
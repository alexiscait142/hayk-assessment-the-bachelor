require "pry"

def get_first_name_of_season_winner(data, season)
  data[season].find{|info| info["status"] == "Winner"}["name"].split(" ")[0]
end

def get_contestant_name(data, occupation)
  data.each do |season, info|
    info.find do |girl|
      if girl["occupation"] == occupation
        return girl["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  array = []
  data.each do |season, info|
    info.select do |girl|
      if girl["hometown"] == hometown
        array << girl["name"]
      end
    end
  end
  array.count
end

def get_occupation(data, hometown)
  data.each do |season, info|
    info.find do |girl|
      if girl["hometown"] == hometown
        return girl["occupation"]
      end
    end
  end
end

# def get_average_age_for_season(data, season)
#   sum = 0
#   average = 0
#   data[season].map do |info|
#     array = info["age"].to_i
#     sum = array.reduce(0){|memo, age| memo += age}
#     average = sum / array.count
#   end
#   average
# end

# def get_average_age_for_season(data, season)
#   array = []
#   sum = 0
#   average = 0
#   data[season].each do |info|
#     info.map do |girl|
#       sum += girl["age"].to_f
#       average = sum / info.count
#     array << girl["age"].to_i
#     sum = array.reduce(0){|memo, age| memo += age}
#     average = sum / array.count
#     end
#   end
#   average
# end

# info.map do |girl|
      # sum += girl["age"].to_f
      # average = sum / info.count

def get_average_age_for_season(data, season)
  array = []
  sum = 0
  average = 0
  data[season].each do |info|
    array << (info["age"].to_f)
    sum = (array.reduce(0){|memo, age| memo += age})
    average = (sum / array.count).round
  end
  average
end

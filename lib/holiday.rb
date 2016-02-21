require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  secondsupply = []
    holiday_hash.each do |season, event|
      if :summer == season
        event.each do |events, supply|
          supply.each do |item|
            if "BBQ" == item
              secondsupply << item
            end
          end
        end
      end
    end
    secondsupply[0]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above 
  # add the second argument, which is a supply, to BOTH the 
  # Christmas AND the New Year's arrays
    holiday_hash.each do |season, event|
      if :winter == season
          event.each do |events, goods|
            goods << supply
          end
      end
    end
end
 

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
    holiday_hash.each do |season, event|
      event.each do |events, goods|
        if :memorial_day == events
          goods << supply
        end
      end
    end
  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
    holiday_hash.each do |seasonname, event|
      if season == seasonname

        holiday_hash[seasonname][holiday_name] = {}
        holiday_hash[seasonname][holiday_name] = supply_array

      end
    end
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
    # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
      output = [] 
      holiday_hash.each do |seasonname, event|
        if :winter == seasonname
           output = holiday_hash[seasonname].values.flatten 
        end
      end
      output
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
    output = ""
    output_capitalize = []
    textForJoin = []
    holiday_hash.each do  |seasonname, event|#seasonname ig winter,   event ig christmas
      output +=  seasonname.to_s.capitalize + ":\n" #events ig christmas goods winter
        event.each do |events, goods|
          #if :new_years == events #test 用のif statement
            output += "  "
            output_capitalize = events.to_s.split("_") #
            output_capitalize.each do |text|
              textForJoin.push(text.to_s.capitalize)
            end
            output += textForJoin.join(" ")
            output += ": "
            output += goods.join(", ")
            output += "\n"

            textForJoin = [] #for initialize
          #end #test 用のif statement
        end
    end
    puts output
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  keyword = "BBQ"
  switch = false
  output = []
  holiday_hash.each do |key, value| #key :summer
    value.each do |key, values| #key event values is array. value {:event => [111,222]}
      if values.include?(keyword) 
          output.push(key)
          #binding.pry
      end
    end
  end
  output
end








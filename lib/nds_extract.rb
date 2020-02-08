$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  counter = 0
  name_list = []
  while counter < source.length do 
    name_list.push(source[counter][:name])
    counter += 1
  end
  name_list
end

def total_gross(source)
  counter = 0
  grand_total = 0
  while counter < list_of_directors(source).length do 
    key = list_of_directors(source)[counter]
    grand_total += directors_totals(source)[key]
    counter += 1
  end
  grand_total
end



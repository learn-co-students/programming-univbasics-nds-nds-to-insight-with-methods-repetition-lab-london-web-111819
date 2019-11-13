$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {} ;  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(specific_director)
  total_for_the_specific_director = 0 ;  index = 0
  while index < specific_director[:movies].length do
    total_for_the_specific_director += specific_director[:movies][index][:worldwide_gross]
    index += 1
  end
  total_for_the_specific_director
end

def list_of_directors(source)
#Objective:   Extracts the diretor names from the source hash
#Input        The whole db and its "first level"/key has the names of the directors
#Output:      Array of director names
  
  index = 0 ;  array_list_of_directors =[]
  while index < source.length do
    array_list_of_directors[index] = source[index][:name]
    index += 1 
  end
  array_list_of_directors
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  grand_total = 0 ; index = 0
  while index < list_of_directors(source).length do #list_of_directors is called ONCE!
    grand_total +=  directors_totals(source)[list_of_directors(source)[index]] #array received from list_of_directors is ITERATED
    index += 1 
  end
  grand_total
end

require 'pry'
#a=total_gross(directors_database)
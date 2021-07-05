require 'pry'
require "yaml"
# require modules here

def load_library(cons)
  # code goes here 
cons = YAML.load_file('lib/emoticons.yml')
final = {}

cons.each do |style, face|
  final[style] = {"english": face[0], "japanese": face[1]}
end 
  final
end 

def get_japanese_emoticon(cons, emoticon)
  faces = load_library(cons)
    faces.find do |style, face| 
      if face[:english] == emoticon
        return face[:japanese]
        end
      end
  faces.include?(emoticon) == nil 
  return "Sorry, that emoticon was not found"
end 

def get_english_meaning(cons, emoticon)
 faces = load_library(cons)
   faces.find do |style, face|
    if face[:japanese] == emoticon
      return style
    end 
  end 
   faces.include?(emoticon) == nil 
   return "Sorry, that emoticon was not found"
end 
# require modules here
require 'yaml'
require 'pry'


def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  emoticons.keys.to_h{ |x| [x, {
    english: emoticons[x][0],
    japanese: emoticons[x][1]
  }]}
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  library = load_library(path)
  result = library.select { | key, value | value[:english] == emoticon }.values[0]
  return "Sorry, that emoticon was not found" if !result
  result[:japanese]


end

def get_english_meaning(path, emoticon)
  # code goes here
  library = load_library(path)
  result = library.select { | key, value | value[:japanese] == emoticon }.keys[0]
  return "Sorry, that emoticon was not found" if !result
  result
end


 require 'pry'
 require 'yaml'

def load_library(emoticons)
  new_list = {}
  emoticons_hash = YAML.load_file(emoticons)
  emoticons_hash.each do |key, value|
    new_list[key] = {}
    new_list[key][:english] = value[0]
    new_list[key][:japanese] = value[1]
  end
  return new_list
end

def get_japanese_emoticon(path,emoji)
  library = load_library(path)
  emoticon = library.find do |key,value|
    library[key][:english] == emoji
  end
  if emoticon
      emoticon[1][:japanese]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path,emoji)
  library = load_library(path)
  emoticon = library.find do |key,value|
    library[key][:japanese] == emoji
  end
  if emoticon
      emoticon[0]
  else
    "Sorry, that emoticon was not found"
  end
end

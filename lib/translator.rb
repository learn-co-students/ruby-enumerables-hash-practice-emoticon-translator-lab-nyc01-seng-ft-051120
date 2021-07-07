require 'pry'
require 'yaml'
def load_library(file_path)
  library = YAML.load_file(file_path)
  emoticons = {}
   library.each do |name, emos|
     #binding.pry 
     english_emo = emos[0]
     japan_emo = emos[1]
     emoticons[name] = {}
     emoticons[name][:english]= english_emo
     emoticons[name][:japanese]= japan_emo
  end
  emoticons
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  response = nil
  library.keys.each do |name|
    if emoticon == library[name][:english]
      response = library[name][:japanese]
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  response = nil
  library.keys.each do |emo|
    if emoticon == library[emo][:japanese]
      response = emo
    end
  end
  if response == nil
    return "Sorry, that emoticon was not found"
  else
    return response
  end
end
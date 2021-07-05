# require modules here
require "yaml"
require 'pry'
def load_library(file_path="lib/emoticons.yml")
  # code goes here
result={}
  dictionary = YAML.load_file(file_path)
   dictionary.each { |val, (val1, val2)|
  result[val]={english:  val1, japanese:  val2}
  }
return result
end

def get_japanese_emoticon(file_path="lib/emoticons.yml", emoticons=":)")
  # code goes here
japanese=""
data=load_library(file_path)
data.each{ |key, val|
  if emoticons==val[:english]
    japanese=val[:japanese]
  end
}
if japanese==""
  return "Sorry, that emoticon was not found"
else return japanese
end
end

def get_english_meaning(file_path="lib/emoticons.yml", emoticons=":)")
  # code goes here
  meaning=""
  result=load_library(file_path)
  result.each{|val0, val1|
if result[val0][:english]==emoticons || result[val0][:japanese]==emoticons
  meaning=val0
  break
end

  }
  if meaning==""
    return "Sorry, that emoticon was not found"
  else meaning
  end
end
#binding.pry

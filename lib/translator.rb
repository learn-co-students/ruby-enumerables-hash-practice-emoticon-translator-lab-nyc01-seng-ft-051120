require "yaml"
require 'pry'
def load_library(file)
  library = YAML.load_file(file)
  emoticons = {}
  library.each do |feeling, value|
    emoticons[feeling] = {}
    emoticons[feeling][:japanese] = value[1]
    emoticons[feeling][:english] = value[0]
  end
  emoticons
end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  emoticons.keys.find do |key|
    if emoticon == emoticons[key][:english]
      return emoticons[key][:japanese]
    end
  end
    return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  emoticons.keys.find do |key|
    if emoticon == emoticons[key][:japanese]
      return key
    end
  end
    return "Sorry, that emoticon was not found"
end

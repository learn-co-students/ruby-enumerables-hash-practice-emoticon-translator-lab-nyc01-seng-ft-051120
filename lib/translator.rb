# require modules here
require "yaml"
require "pry"

def load_library(file_path)
  emoticons_hash = {}
  emoticons = YAML.load_file('lib/emoticons.yml')
  emoticons.each do |names, signs|
    emoticons_hash[names] = {:english => signs[0], :japanese => signs[1]}
  end
    emoticons_hash
end

def get_english_meaning(file_path, japanese_emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |names, signs|
    if signs[:japanese] == japanese_emoticon
      return names
    end
  end
 return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon(file_path, western_emoticon)
  emoticons = load_library(file_path)
  emoticons.each do |names, signs|
    if western_emoticon == signs[:english]
      return signs[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end









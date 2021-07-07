#emoticons = YAML.load(File.read('lib/emoticons.yml'))
require 'yaml'
require 'pry'


def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  emoticons.each do |key, value|
    emoticon_hash[key] = {:english => value[0], :japanese => value[1]}
  end
  emoticon_hash
end

def get_japanese_emoticon(path, western_emoticon)
  emoticon_hash = load_library(path)
  japanese_match = "Sorry, that emoticon was not found"
  emoticon_hash.each do |key, value|
    if value[:english] == western_emoticon
      japanese_match = value[:japanese]
    end
  end
  japanese_match
end

def get_english_meaning(path, japanese_emoticon)
  emoticon_hash = load_library(path)
  english_meaning = "Sorry, that emoticon was not found"
  emoticon_hash.each do |key, value|
    if value[:japanese] == japanese_emoticon
      english_meaning = key
    end
  end
  english_meaning
end

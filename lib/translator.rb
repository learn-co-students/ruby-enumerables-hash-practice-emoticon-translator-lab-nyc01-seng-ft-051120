# require modules here
require "yaml"


def load_library(file)
    emoticons = YAML.load_file(file)
    emoji_hash = Hash.new

    emoticons.each { |emoji_name,emoji_symbols|
      emoji_hash[emoji_name] = {
        :english => emoji_symbols.first,
        :japanese => emoji_symbols.last
      }
    }
    emoji_hash
end

def get_japanese_emoticon(file,english_emoji)
  # code goes here
  emoji_hash = load_library(file)
  emoji_hash.each { |emoji_name,meaning_hash|
    if meaning_hash[:english] == english_emoji
      return meaning_hash[:japanese]
    end
  }
  p "Sorry, that emoticon was not found"

end

def get_english_meaning(file,japanese_emoji)
  # code goes here
  emoji_hash = load_library(file)
  emoji_hash.each { |emoji_name,meaning_hash|
    if meaning_hash[:japanese] == japanese_emoji
      return emoji_name
    end
  }
  p "Sorry, that emoticon was not found"
end
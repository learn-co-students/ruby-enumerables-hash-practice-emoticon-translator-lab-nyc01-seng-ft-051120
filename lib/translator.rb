require 'yaml'

def load_library(file)
  
  hash_of_emoticons=YAML.load_file(file)
  
  new_hash_of_emoticons={}
  
  hash_of_emoticons.each do |name_of_emoticon, emojis| 
    
  
  new_hash_of_emoticons[name_of_emoticon]={}
  new_hash_of_emoticons[name_of_emoticon][:english]=emojis[0] 
  new_hash_of_emoticons[name_of_emoticon][:japanese]=emojis[1]
 
 end
  new_hash_of_emoticons
end



def get_english_meaning(file, japanese_emoji)
  
  emoji_translator_hash=load_library(file)
  
  emoji_translator_hash.each do |name_of_emoticon,two_emojis|
  
   if emoji_translator_hash[name_of_emoticon][:japanese]==japanese_emoji
     return name_of_emoticon
   end
 end 
  return "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file, english_emoji)
  
  emoji_translator_hash=load_library(file)
  
  emoji_translator_hash.each do |name_of_emoticon,two_emojis|
  
   if emoji_translator_hash[name_of_emoticon][:english]==english_emoji
     return emoji_translator_hash[name_of_emoticon][:japanese]
   end
 end
  return "Sorry, that emoticon was not found"
end
# require modules here
require "pry"

require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
 translated_hash = Hash.new
  
  emoticons.each do |emoticon, emoticon_array|
    if !translated_hash[emoticon]
        translated_hash[emoticon] = {}
    end

    translated_hash[emoticon][:english] = emoticon_array [0]
    translated_hash[emoticon][:japanese] = emoticon_array [1]
  end 
  translated_hash
end


def get_japanese_emoticon(file_path, emoticon_symbol)
  library = load_library(file_path)
  
  result = library.keys.find do |expression|
    library[expression][:english] == emoticon_symbol
  end 
  
  if result != nil
  library[result][:japanese]
  else 
     "Sorry, that emoticon was not found"
  end
end 


# get_english_meaning, that takes a Japanese emoticon and 
# returns its name in English. 
# This method will rely on load_library to first load the YAML file.


def get_english_meaning(file_path, emoticon_symbol)
  library = load_library(file_path)
  
  result = library.keys.find do |expression|
    library[expression][:japanese] == emoticon_symbol
  end 
  
  if result != nil
   result
  else 
     "Sorry, that emoticon was not found"
       # binding.pry
  end
end 


# translated_hash =
# {"angel"=>{:english=>"O:)", :japanese=>"☜(⌒▽⌒)☞"},
# "angry"=>{:english=>">:(", :japanese=>"ヽ(ｏ`皿′ｏ)ﾉ"},
# "bored"=>{:english=>":O", :japanese=>"(ΘεΘ;)"},
# "confused"=>{:english=>"%)", :japanese=>"(゜.゜)"},
# "embarrassed"=>{:english=>":$", :japanese=>"(#^.^#)"},
# "fish"=>{:english=>"><>", :japanese=>">゜))))彡"},
# "glasses"=>{:english=>"8D", :japanese=>"(^0_0^)"},
# "grinning"=>{:english=>"=D", :japanese=>"(￣ー￣)"},
# "happy"=>{:english=>":)", :japanese=>"(＾ｖ＾)"},
# "kiss"=>{:english=>":*", :japanese=>"(*^3^)/~☆"},
# "sad"=>{:english=>":'(", :japanese=>"(Ｔ▽Ｔ)"},
# "surprised"=>{:english=>":o", :japanese=>"o_O"},
# "wink"=>{:english=>";)", :japanese=>"(^_-)"}}


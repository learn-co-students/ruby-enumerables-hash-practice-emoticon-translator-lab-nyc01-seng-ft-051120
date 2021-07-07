require "yaml"

def load_library(str)
  new_thing = YAML.load_file(str)
  better_thing = new_thing.reduce({}) do |memo, (key, value)|
  	memo[key.to_s] = {:english => value[0], :japanese => value[1]}
  	memo
  end
  better_thing
end

def get_japanese_emoticon(path, emote)
  data = load_library(path)
  translation = data.reduce(nil) do |memo, (key, value)|
  	if(emote == value[:english])
  		memo = value[:japanese].to_s
  	end
  	memo
  end
  if !translation
  	translation = "Sorry, that emoticon was not found"
  end
  translation 
end

def get_english_meaning(path, emote)
  data = load_library(path)
  translation = data.reduce(nil) do |memo, (key, value)|
  	if(emote == value[:japanese])
  		memo = key.to_s
  	end
  	memo
  end
  if !translation
  	translation = "Sorry, that emoticon was not found"
  end
  translation 
end
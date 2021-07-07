# require modules here
require 'yaml'
#emoticons = YAML.load_file('./lib/emoticons.yml')
#file = "./lib/emoticons.yml"

def load_library(file)
  emo = YAML.load_file(file)

  emo.each do |k, v|
    emo[k] = {:english => v[0], :japanese => v[1]}
  end

  emo
end



def get_japanese_emoticon(file, emoticon)
  emo = load_library(file)

  emo.each do |emotion, translations|
    if emo[emotion][:english] == emoticon
      return emo[emotion][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end



def get_english_meaning(file, emoticon)
  emo = load_library(file)

  emo.each do |emotion, translations|
    if emo[emotion][:japanese] == emoticon
      return emotion
    end
  end
  return "Sorry, that emoticon was not found"
end

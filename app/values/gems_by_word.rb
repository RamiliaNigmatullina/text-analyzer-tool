require "singleton"

class GemsByWord
  include Singleton

  def gems_list(word)
    gems_by_word[word]
  end

  private

  def gems_by_word
    @gems_by_word ||= JSON.parse(file)
  end

  def file
    File.read(Rails.root.join("config", "gems_by_word.json"))
  end
end

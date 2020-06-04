module GenerateCommands
  class BuildCommandsForInstallingSpecificGems
    include Interactor

    delegate :document, :position, to: :context

    def call
      text_words.each do |word|
        lemma = normalize(word.downcase)
        gems = fetch_gems(lemma)

        gems&.each { |gem| create_command("bundle add #{gem}") }
      end
    end

    private

    def fetch_gems(word)
      gems_by_word.gems_list(word)
    end

    def normalize(word)
      lemmatizer.lemma(word)
    end

    def text_words
      document.text.split(" ")
    end

    def create_command(text)
      document.commands.create(position: position, text: text)
      increase_position
    end

    def increase_position
      context.position += 1
    end

    def lemmatizer
      @lemmatizer ||= Lemmatizer.new
    end

    def gems_by_word
      @gems_by_word ||= GemsByWord.instance
    end
  end
end

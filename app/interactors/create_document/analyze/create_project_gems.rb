module CreateDocument
  module Analyze
    class CreateProjectGems
      include Interactor

      delegate :document, to: :context

      before do
        @created_gems = []
      end

      def call
        text_words.each do |word|
          lemma = normalize(word.downcase)
          gems = fetch_gems(lemma)

          gems&.each { |gem_name| create_project_gem(gem_name) }
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
        document.text.downcase.delete(",").delete(".").split(" ")
      end

      def create_project_gem(gem_name)
        return if gem_name.in?(@created_gems)

        project_gem = document.project_gems.create(name: gem_name)
        @created_gems << gem_name

        context.fail!(error: project_gem.errors.full_messages.join(" ")) if project_gem.invalid?
      end

      def lemmatizer
        @lemmatizer ||= Lemmatizer.new
      end

      def gems_by_word
        @gems_by_word ||= GemsByWord.instance
      end
    end
  end
end

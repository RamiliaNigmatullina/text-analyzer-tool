module CreateDocument
  module Analyze
    class DivideTextIntoSentences
      include Interactor

      delegate :document, to: :context

      def call
        context.sentences = sentences
      end

      private

      def sentences
        splitted_sentences.map do |sentence|
          template = find_template(sentence)

          ::Sentence.new(text: sentence, template: template)
        end
      end

      def find_template(text)
        Template.similarity_like(text).first
      end

      def splitted_sentences
        document.text.squish.split(". ").map { |sentence| sentence.delete(".") }
      end
    end
  end
end

module CreateDocument
  module Analyze
    class DivideTextIntoSentences
      include Interactor

      delegate :document, to: :context

      def call
        context.sentences = document.text.squish.split(". ").map { |sentence| sentence.gsub(".", "")  }
      end
    end
  end
end

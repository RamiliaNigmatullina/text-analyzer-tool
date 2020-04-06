require "google/cloud/language"

module CreateDocument
  module Google
    class AnalyzeText
      include Interactor

      delegate :document, to: :context

      def call
        context.analyzed_text = analyzed_text
      end

      private

      def analyzed_text
        language.analyze_entities(document: { content: document.text, type: :PLAIN_TEXT })
      end

      def language
        ::Google::Cloud::Language.language_service
      end
    end
  end
end

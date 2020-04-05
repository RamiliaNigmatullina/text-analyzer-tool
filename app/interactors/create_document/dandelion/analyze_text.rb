module CreateDocument
  module Dandelion
    class AnalyzeText
      include Interactor

      delegate :document, to: :context

      def call
        context.analyzed_text = analyzed_text
      end

      private

      def analyzed_text
        DandelionAdapter.new.analyze_text(query: query)
      end

      def query
        {
          text: document.text,
          include: "types%2Cabstract%2Ccategories%2Calternate_labels",
          lang: "en",
          min_confidence: 0,
          social: false,
          top_entities: 8,
          country: -1
        }
      end
    end
  end
end

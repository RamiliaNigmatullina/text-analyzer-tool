module CreateDocument
  module Dandelion
    class ExtractEntities
      include Interactor

      delegate :analyzed_text, to: :context

      def call
        context.entity_names = entity_names.uniq
      end

      private

      def entity_names
        analyzed_text["annotations"].map { |annotation| annotation["spot"] }
      end
    end
  end
end

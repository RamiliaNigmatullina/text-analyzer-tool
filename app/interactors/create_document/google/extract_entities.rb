module CreateDocument
  module Google
    class ExtractEntities
      include Interactor

      delegate :analyzed_text, to: :context
      delegate :entities, to: :analyzed_text

      def call
        context.entity_names = entity_names
      end

      private

      def entity_names
        entities.map do |entity|
          entity.name.gsub(" ", "_").classify
        end
      end

      def entities
        analyzed_text.entities.select { |entity| entity.type == :PERSON }
      end
    end
  end
end

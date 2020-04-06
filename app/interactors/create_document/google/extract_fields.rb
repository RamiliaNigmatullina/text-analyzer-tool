module CreateDocument
  module Google
    class ExtractFields
      include Interactor

      delegate :analyzed_text, to: :context
      delegate :entities, to: :analyzed_text

      def call
        context.field_names = field_names
      end

      private

      def field_names
        entities.map do |entity|
          entity.name.gsub(" ", "_")
        end
      end

      def entities
        analyzed_text.entities.select { |entity| entity.type == :OTHER }
      end
    end
  end
end

module CreateDocument
  module Analyze
    class CreateFields
      include Interactor

      delegate :document, :models_list, to: :context

      def call
        models_list.each { |model| create_fields(model) }
      end

      private

      def create_fields(model)
        entity = find_entity(model)

        model[:fields].each { |field_data| create_field(field_data, entity) }
      end

      def create_field(field_data, entity)
        field = entity.fields.create(name: field_data[:name], kind: field_data[:type])
        context.fail!(error: field.errors.full_messages.join(", ")) if field.invalid?
      end

      def find_entity(model)
        document.entities.find_by(name: model[:name])
      end
    end
  end
end

module CreateDocument
  module Analyze
    class CreateEntities
      include Interactor

      delegate :document, :models_list, to: :context

      def call
        models_list.each do |model|
          create_entity(model)
        end
      end

      private

      def create_entity(model)
        entity = document.entities.create(name: model[:name])

        context.fail!(error: entity.errors.full_messages.join(", ")) if entity.invalid?
      end
    end
  end
end

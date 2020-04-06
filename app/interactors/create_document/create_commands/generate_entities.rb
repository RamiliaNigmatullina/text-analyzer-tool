module CreateDocument
  module CreateCommands
    class GenerateEntities
      include Interactor

      delegate :document, :models_list, to: :context

      def call
        models_list.each_with_index { |model, index| create_command(model[:name], index) }
      end

      private

      def create_command(model_name, index)
        command = document.commands.create(text: text(model_name).squish, position: index)

        context.fail!(error: error(command)) if command.invalid?
      end

      def text(entity_name)
        format("rails generate scaffold #{entity_name} #{fields}")
      end

      def fields
        # field_names.map { |field| "#{field}:string" }.join(" ")
      end

      def error(command)
        command.errors.full_messages.join(", ")
      end
    end
  end
end
module CreateDocument
  module CreateCommands
    class GenerateEntities
      include Interactor

      delegate :document, :entity_names, :field_names, to: :context

      def call
        entity_names.each_with_index { |entity_name, index| create_command(entity_name, index) }
      end

      private

      def create_command(entity_name, index)
        command = document.commands.create(text: text(entity_name).squish, position: index)

        context.fail!(error: error(command)) if command.invalid?
      end

      def text(entity_name)
        format("rails generate scaffold #{entity_name} #{fields}")
      end

      def fields
        field_names.map { |field| "#{field}:string" }.join(" ")
      end

      def error(command)
        command.errors.full_messages.join(", ")
      end
    end
  end
end

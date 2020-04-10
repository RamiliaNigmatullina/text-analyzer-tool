module CreateDocument
  module CreateCommands
    class GenerateEntities
      include Interactor

      delegate :document, :models_list, to: :context

      def call
        models_list.each_with_index { |model, index| create_command(model, index) }
      end

      private

      def create_command(model, index)
        command = document.commands.create(text: text(model).squish, position: index)

        context.fail!(error: error(command)) if command.invalid?
      end

      def text(model)
        format("rails generate scaffold #{model[:name]} #{fields(model[:fields])}")
      end

      def fields(fields)
        fields.map { |field| "#{field[:name]}:#{field[:type]}" }.join(" ")
      end

      def error(command)
        command.errors.full_messages.join(", ")
      end
    end
  end
end

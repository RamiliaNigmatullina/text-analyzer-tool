class BuildCommands
  include Interactor

  delegate :entities_names, to: :context

  def call
    context.commands_list = CommandsList.create(commands: commands.join("\n"))
  end

  private

  def commands
    entities_names.map do |entity_name|
      "rails generate scaffold #{entity_name}"
    end
  end
end

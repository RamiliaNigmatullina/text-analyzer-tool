class BuildScaffoldCommands
  include Interactor

  delegate :document, :position, to: :context

  def call
    document.entities.each do |entity|
      create_command(text(entity))
    end
  end

  private

  def text(entity)
    format("rails generate scaffold #{entity.name} #{fields_data(entity.fields)}")
  end

  def fields_data(fields)
    fields.map { |field| "#{field.name}:#{field.kind}" }.join(" ")
  end

  def create_command(text)
    document.commands.create(position: position, text: text)
    increase_position
  end

  def increase_position
    context.position += 1
  end
end

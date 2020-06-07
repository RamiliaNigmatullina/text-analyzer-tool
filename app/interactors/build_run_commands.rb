class BuildRunCommands
  include Interactor

  delegate :document, :position, to: :context

  def call
    create_command("rake db:migrate")
    create_command("rails server")
  end

  private

  def create_command(text)
    document.commands.create(position: position, text: text)
    increase_position
  end

  def increase_position
    context.position += 1
  end
end

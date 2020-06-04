class BuildSetupCommands
  include Interactor
  include ActiveSupport::Inflector

  delegate :document, :position, to: :context

  def call
    create_command("rails new #{app_name}")
    create_command("cd #{app_name}")
    create_command("rails server")
  end

  private

  def create_command(text)
    document.commands.create(position: position, text: text)
    increase_position
  end

  def app_name
    @app_name ||= parameterize(document.name, separator: "_")
  end

  def increase_position
    context.position += 1
  end
end

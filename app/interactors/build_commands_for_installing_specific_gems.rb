class BuildCommandsForInstallingSpecificGems
  include Interactor

  delegate :document, :position, to: :context

  def call
    create_command("bundle add #{project_gem_names}")
  end

  private

  def project_gem_names
    document.project_gems.map(&:name).join(" ")
  end

  def create_command(text)
    document.commands.create(position: position, text: text)
    increase_position
  end

  def increase_position
    context.position += 1
  end
end

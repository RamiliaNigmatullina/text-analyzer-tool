class BuildCommandsForInstallingSpecificGems
  include Interactor

  delegate :document, :position, to: :context

  def call
    document.project_gems.each do |project_gem|
      create_command("bundle add #{project_gem.name}")
    end
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

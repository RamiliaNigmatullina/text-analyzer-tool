class RemoveExistingCommands
  include Interactor

  delegate :document, to: :context

  def call
    document.commands.destroy_all
  end
end

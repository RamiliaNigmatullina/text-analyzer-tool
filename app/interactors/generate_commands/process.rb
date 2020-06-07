module GenerateCommands
  class Process
    include Interactor::Organizer
    include InteractorWithTransaction

    before do
      context.position = 0.0
    end

    organize BuildSetupCommands,
      BuildCommandsForInstallingCommonGems,
      BuildCommandsForInstallingSpecificGems,
      BuildScaffoldCommands

    def position_calculator
      @position_calculator ||= PositionCalculator.new(document)
    end
  end
end

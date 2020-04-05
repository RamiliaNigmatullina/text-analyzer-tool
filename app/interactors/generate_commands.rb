class GenerateCommands
  include Interactor::Organizer

  organize \
    AnalyzeText,
    ParseResponse,
    BuildCommands
end

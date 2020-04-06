module CreateDocument
  class Process
    include Interactor::Organizer

    organize CreateDocument::SaveRecord,
      CreateDocument::Google::Analyze,
      CreateDocument::CreateCommands::GenerateEntities
  end
end

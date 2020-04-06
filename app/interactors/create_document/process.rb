module CreateDocument
  class Process
    include Interactor::Organizer

    organize CreateDocument::SaveRecord,
      CreateDocument::Analyze::PrepareParams,
      CreateDocument::Analyze::DivideTextIntoSentences,
      CreateDocument::Analyze::ParseSentences::DefineType,
      CreateDocument::CreateCommands::GenerateEntities
  end
end

module CreateDocument
  class Process
    include Interactor::Organizer

    organize CreateDocument::SaveRecord,
      CreateDocument::Dandelion::AnalyzeText,
      CreateDocument::Dandelion::ExtractEntities,
      CreateDocument::CreateCommands::GenerateEntities
  end
end

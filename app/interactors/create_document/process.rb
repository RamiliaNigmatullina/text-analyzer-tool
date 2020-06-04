module CreateDocument
  class Process
    include Interactor::Organizer

    organize CreateDocument::SaveRecord,
      CreateDocument::Analyze::PrepareParams,
      CreateDocument::Analyze::DivideTextIntoSentences,
      CreateDocument::Analyze::ParseSentences::ExtractModelNames,
      CreateDocument::Analyze::ParseSentences::ExtractFieldNames,
      CreateDocument::Analyze::ParseSentences::ExtractFieldTypes,
      CreateDocument::Analyze::CreateEntities,
      CreateDocument::Analyze::CreateFields,
      CreateDocument::Analyze::CreateProjectGems
  end
end

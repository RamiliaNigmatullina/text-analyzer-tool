module CreateDocument
  module Google
    class Analyze
      include Interactor::Organizer

      organize CreateDocument::Google::AnalyzeText,
        CreateDocument::Google::ExtractEntities,
        CreateDocument::Google::ExtractFields
    end
  end
end

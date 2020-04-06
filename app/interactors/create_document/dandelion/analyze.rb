module CreateDocument
  module Dandelion
    class Analyze
      include Interactor::Organizer

      organize CreateDocument::Dandelion::AnalyzeText,
        CreateDocument::Dandelion::ExtractEntities
    end
  end
end

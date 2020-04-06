module CreateDocument
  module Analyze
    class PrepareParams
      include Interactor

      def call
        context.models_list = []
      end
    end
  end
end

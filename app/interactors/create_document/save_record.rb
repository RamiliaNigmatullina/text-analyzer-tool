module CreateDocument
  class SaveRecord
    include Interactor

    delegate :document, to: :context

    def call
      document.save || context.fail!(error: error)
    end

    private

    def error
      document.errors.full_messages.join(", ")
    end
  end
end

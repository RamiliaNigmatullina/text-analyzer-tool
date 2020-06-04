class SaveRecord
  include Interactor

  delegate :document, :document_params, to: :context

  def call
    document.update(document_params) || raise_error
  end

  private

  def raise_error
    context.fail!(error: document.errors.full_messages.join(", "))
  end
end

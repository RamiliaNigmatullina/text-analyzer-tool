class ParseResponse
  include Interactor

  delegate :response, to: :context

  def call
    context.entities_names = entities_names.uniq
  end

  private

  def entities_names
    response["annotations"].map { |annotation| annotation["spot"] }
  end
end

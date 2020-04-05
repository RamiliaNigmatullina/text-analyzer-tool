class AnalyzeText
  include Interactor

  delegate :text, to: :context

  def call
    context.response = adapter.analyze_text(query: query)
  end

  private

  def adapter
    DandelionAdapter.new
  end

  def query
    {
      text: text.titleize,
      include: "types%2Cabstract%2Ccategories%2Calternate_labels",
      lang: "en",
      min_confidence: 0,
      social: false,
      top_entities: 8,
      country: -1,
    }
  end
end

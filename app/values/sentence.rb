class Sentence
  attr_reader :text, :template, :template_text, :template_kind

  delegate :kind, :text, to: :template, prefix: true, allow_nil: true

  def initialize(text:, template: nil)
    @text = text
    @template = template
  end
end

class PositionCalculator
  def initialize(document)
    @document = document
  end

  def next_position
    last_position + 1
  end

  private

  attr_reader :document

  def last_position
    return 0 if document.commands.empty?

    document.commands.order(:position).last.position
  end
end

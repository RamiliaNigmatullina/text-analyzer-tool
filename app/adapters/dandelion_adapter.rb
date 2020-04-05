class DandelionAdapter
  include HTTParty

  base_uri(ENV.fetch("DANDELION_URI"))

  def initialize
    @token = ENV.fetch("DANDELION_TOKEN")
  end

  def analyze_text(query:)
    self.class.get("/datatxt/nex/v1", query: query.merge(authorization_data), headers: {})
  end

  private

  attr_reader :token

  def authorization_data
    { token: token }
  end
end

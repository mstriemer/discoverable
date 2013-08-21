require 'toystore'

class Issue
  include Toy::Store

  attribute :title, String
  attribute :body, String

  def self.all
    adapter.client.list(:issues).map(&method(:new))
  end
end

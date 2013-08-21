class IssuesController < ApplicationController
  respond_to :json

  def index
    respond_with issues
  end

  def issues
    [
      {
        id: 1,
        title: 'Write some docs for sawyer',
        body: "There aren't any docs and that really sucks.",
      },
      {
        id: 2,
        title: 'Write some more docs for sawyer',
        body: "There REALLY aren't any docs and that really sucks.",
      }
    ]
  end
end

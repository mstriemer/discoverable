class ApiController < ApplicationController
  respond_to :json

  def index
    respond_with _links: {
      issues: {
        href: '/issues',
        methods: 'get,post',
      },
      issue: {
        href: '/issues/{id}',
        methods: 'get',
        templated: true,
      }
    }
  end
end

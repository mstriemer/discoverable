require 'sawyer'
require './lib/issue'

class ApiBrowser
  def list(rel)
    api.rels[rel].get.data.map { |row| row.attrs }
  end

  def find(rel, id)
    api.rels[rel].get(id: id).data[0].attrs
  end

  def api
    @api ||= agent.tap { |a| a.start }
  end

  def agent
    @agent ||= Sawyer::Agent.new('http://localhost:3000') do |http|
      http.headers['accept'] = 'application/json'
    end
  end
end

def rest_adapter(rel)
  eval(<<-MODULE)
    Module.new do
      def rel
        #{rel.inspect}
      end

      def read(key, options=nil)
        client.find(rel, key)
      end

      def write(key, value, options=nil)
      end

      def delete(key, options=nil)
      end

      def clear(options=nil)
      end
    end
  MODULE
end

Adapter.define(:issue, rest_adapter(:issue))

Issue.adapter :issue, ApiBrowser.new

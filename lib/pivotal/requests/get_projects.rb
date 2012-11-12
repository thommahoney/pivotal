class Pivotal::Client
  class Real
    def get_projects(params={})
      request(
        :path => "/projects"
      )
    end
  end # Real
  class Mock
    def get_projects(params={})
      projects = self.data[:projects]

      response(
        :body   => {"projects" => projects},
        :status => 200
      )
    end
  end # Mock
end

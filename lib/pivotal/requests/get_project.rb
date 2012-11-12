class Pivotal::Client
  class Real
    def get_project(params={})
      id = params["id"]

      request(
        :path => "/projects/#{id}"
      )
    end
  end # Real
  class Mock
    def get_project(params={})
      id      = params["id"]
      project = self.data[:projects][id]

      if project
        response(
          :body    => {"project" => project},
          :status  => 200
        )
      else
        response(
          :status  => 404
        )
      end
    end
  end # Mock
end

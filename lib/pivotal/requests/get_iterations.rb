class Pivotal::Client
  class Real
    def get_iterations(params={})
      id         = params["id"]
      project_id = params["project_id"]

      request(
        :path => "/projects/#{project_id}/iterations/#{id}"
      )
    end
  end # Real

  class Mock
    def get_iterations(params={})
      id         = params["id"]
      project_id = params["project_id"]
      iteration = self.data[:iterations][id]

      if iteration
        response(
          :body    => {"iteration" => iteration},
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

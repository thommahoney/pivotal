class Pivotal::Client::Iterations < Cistern::Collection
  model Pivotal::Client::Iteration

  attribute :project_id

  def all(params={})
    response = connection.get_iterations(params.merge("project_id" => self.project_id))

    self.clone.load(response.body["iterations"])
  end

  def current
    all("id" => "current").first
  end

  def get(id)
    if data = connection.get_iteration("project_id" => self.project_id, "id" => id).body["iteration"]
      new(data)
    else
      nil
    end
  end
end

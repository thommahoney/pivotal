class Pivotal::Client::Projects < Cistern::Collection
  model Pivotal::Client::Project

  def all(params={})
    response = connection.get_projects

    self.clone.load(response.body["projects"])
  end

  def get(id)
    if data = connection.get_project("id" => id).body["project"]
      new(data)
    else
      nil
    end
  end
end

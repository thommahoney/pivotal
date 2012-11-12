class Pivotal::Client::Projects < Cistern::Collection
  model Pivotal::Client::Project

  def all(params={})
    response = connection.request(path: "/projects")

    self.clone.load(response.body["projects"])
  end

  def get(id)
    if data = connection.request(path: "/projects/#{id}").body["project"]
      new(data)
    else
      nil
    end
  end
end

class Pivotal::Client::Iteration < Cistern::Model
  identity :id

  attribute :name
  attribute :number, type: :integer
  attribute :start, type: :date
  attribute :finish, type: :date
  attribute :team_strength, type: :decimal

  attr_reader :stories

  def iterations
    self.iterations.all(project_id: self.identity)
  end

  def stories=(stories_hash)
    @stories = stories_hash.map{|story| Pivotal::Client::Story.new(story)}
  end
end

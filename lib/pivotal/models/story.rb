class Pivotal::Client::Story < Cistern::Model
  identity :id

  attribute :accepted_at,  type: :date
  attribute :created_at,   type: :date
  attribute :current_state
  attribute :description
  attribute :labels, parser: lambda { |v,opts| (v || "").split(",") }
  attribute :name
  attribute :owned_by
  attribute :project_id,   type: :integer
  attribute :requested_by
  attribute :story_type
  attribute :updated_at,   type: :date
  attribute :url

  attr_reader :stories

  def iterations
    self.iterations.all(project_id: self.identity)
  end

  def stories=(stories_hash)
    @stories = stories.map{|story| Pivotal::Client::Story.new(story)}
  end
end

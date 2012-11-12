class Pivotal::Client::Project < Cistern::Model
  identity :id

  attribute :name
  attribute :iteration_length, type: :integer
  attribute :account
  attribute :current_velocity, type: :integer
  attribute :memberships

end

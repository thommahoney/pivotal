require 'spec_helper'

describe "projects" do
  let(:client) { Pivotal::Client.new }
  let(:project_id) { 635517 }

  it "should fetch all projects" do
    client.projects.all.should_not be_nil
  end

  describe "with a specific project" do
    let(:project) { client.projects.get(project_id) }

    it "should get project's current iteration" do
      current_iteration = project.iterations.current
      current_iteration.should_not be_nil

      current_iteration.stories.should_not be_nil
    end
  end
end

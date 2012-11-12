require 'spec_helper'

describe "projects" do
  let(:client) { Pivotal::Client.new }
  let(:project_id) { 635517 }

  it "should fetch all projects" do
    client.projects.all.should_not be_nil
  end

  it "should fetch a specific project" do
    project = client.projects.get(project_id)
    project.should_not be_nil
  end
end

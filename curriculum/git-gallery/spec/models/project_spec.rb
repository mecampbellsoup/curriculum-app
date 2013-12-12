require 'spec_helper'

describe Project do
  it "should have a name" do
    project = Project.new
    project.name = "test_dude"
    expect(project.name).to eq /[\w]/
  end
end

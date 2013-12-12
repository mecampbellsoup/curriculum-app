require 'spec_helper'

describe "organizations/index" do
  before(:each) do
    assign(:organizations, [
      stub_model(Organization,
        :subdomain => "Subdomain",
        :name => "Name"
      ),
      stub_model(Organization,
        :subdomain => "Subdomain",
        :name => "Name"
      )
    ])
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end

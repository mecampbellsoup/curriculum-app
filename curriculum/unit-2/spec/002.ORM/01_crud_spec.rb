describe "ORMs" do

  # Utilizing ORM functions
  #
  # Instructions:
  #
  # Insert your code in each test where it says "TODO".
  # Do NOT modify any existing test code.
  #
  # You'll be building your ORM into the crowd_fundr_campaign.rb unit.
  # So you'll have to edit that file to make these tests pass.
  #
  # References
  # Sequel lab: https://github.com/flatiron-school/sequel-orms-ruby-003 as reference.
  # Sequel migration docs: http://sequel.rubyforge.org/rdoc/files/doc/schema_modification_rdoc.html#label-Column+types

  context "a CrowdFundrCampaign model" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/migrations"

      require_relative 'crowd_fundr_campaign'
    end

    describe "adding ORM capabilities" do
      it "should subclass Sequel::Model" do
        campaign = CrowdFundrCampaign.new
        campaign.class.superclass.should == Sequel::Model
      end
    end

    describe "create" do
      it "should create a record for CrowdFundrCampaigns" do
        # TODO: Your solution goes here

        CrowdFundrCampaign.all.count.should == 1
      end
    end

    describe "read" do
      it "should have readable fields" do
        campaign = CrowdFundrCampaign.create({
          name: "Soylent",
          tagline: "Free your body.",
          total_funding: 10000000,
          funding_goal: 500000,
          starting_date: Time.new(2013, 6, 15),
          finishing_date: Time.new(2013, 8, 30)
        })

        # TODO: Get these to pass
        expect(campaign.__).to eq("Soylent")
        expect(campaign.__).to eq("Free your body.")
        expect(campaign.__).to eq(10000000)
        expect(campaign.__).to eq(500000)
        expect(campaign.__).to eq(Time.new(2013, 6, 15))
        expect(campaign.__).to eq(Time.new(2013, 8, 30))
      end
    end

    describe "update" do
      it "should change the name of the campaign" do
        campaign_name = "Sham-Wow"
        campaign = CrowdFundrCampaign.create( name: campaign_name )

        # Edit the campaign object and save it
        # TODO: Your solution goes here

        CrowdFundrCampaign.first.name.should_not eq(campaign_name)
      end
    end

    describe "destroy" do
      it "should remove a record from the DB" do
        campaign = CrowdFundrCampaign.create( name: 'Slap Chop' )

        # Delete the campaign record from the database
        # TODO: Your solution goes here

        CrowdFundrCampaign.all.count.should == 0
      end
    end
  end
end

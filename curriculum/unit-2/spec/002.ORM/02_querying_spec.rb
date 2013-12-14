describe "ORMs" do

  # Utilizing ORM Querying Functions
  #
  # Instructions:
  #
  # Edit the CrowdFundrCampaign class to make the following tests pass.
  # You will not need to edit the tests.
  #
  # References:
  #
  # Sequel querying docs:
  #  http://sequel.rubyforge.org/rdoc/files/doc/querying_rdoc.html

  context "querying" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/migrations"

      require_relative 'crowd_fundr_campaign'

      now = Time.now

      @c1 = CrowdFundrCampaign.create({
        name: "The Cactus Book",
        tagline: "Insert pun about book spines",
        total_funding: 300,
        funding_goal: 1000,
        starting_date: Time.new(now.year, 9, 24),
        finishing_date: Time.new(now.year, 12, 31)
      })

      @c2 = CrowdFundrCampaign.create({
        name: "Double Fine Adventure",
        tagline: "From the makers of Monkey Island!",
        total_funding: 50000,
        funding_goal: 1000000,
        starting_date: Time.new(now.year, 5, 24),
        finishing_date: Time.new(now.year, 12, 24)
      })

      @c3 = CrowdFundrCampaign.create({
        name: "Oculus Rift",
        tagline: "Step Into the Game",
        total_funding: 620000,
        funding_goal: 500,
        starting_date: Time.new(now.year, 1, 24),
        finishing_date: Time.new(now.year+1, 8, 24)
      })

      @c4 = CrowdFundrCampaign.create({
        name: "My Yoga Pro Book",
        tagline: "A revolutionary way to learn and practice yoga",
        total_funding: 600,
        funding_goal: 500,
        starting_date: Time.new(now.year, 3, 24),
        finishing_date: Time.new(now.year+1, 12, 01)
      })
    end

    describe "CrowdFundrCampaign" do
      describe "::funded_campaigns" do
        it "should return a set of funded campaigns" do
          funded_campaigns = CrowdFundrCampaign.funded_campaigns

          funded_campaigns.count.should == 2
          funded_campaigns.should include @c3
          funded_campaigns.should include @c4
        end
      end

      describe "::book_campaigns" do
        it "should return all campaigns that have the term 'book' in the title" do
          book_campaigns = CrowdFundrCampaign.book_campaigns

          book_campaigns.count.should == 2
          book_campaigns.should include @c1
          book_campaigns.should include @c4
        end
      end

      describe "::latest_finish" do
        it "should return the campaign that will be the last to end" do
          campaign = CrowdFundrCampaign.latest_finish
          campaign.should == @c4
        end
      end
    end
  end
end

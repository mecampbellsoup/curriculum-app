Sequel.migration do
  change do
    create_table(:crowd_fundr_campaigns) do
      primary_key :id
      string :name
      string :tagline
      integer :funding_goal
      integer :total_funding
      timestamp :starting_date
      timestamp :finishing_date
    end
  end
end

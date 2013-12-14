require 'spec_helper'

# Creating Tables with Migrations
#
# TODO: In 01_migrations/ you will find several files that represent
#       migrations you will need to create. Go through the tests
#       below and edit the migration files to create the tables required
#       to make the specs pass.
#
#       Don't worry about running migrations yourself. The test will run
#       them for you
#
# Hint: read both the English part of the spec, and each assertion to see what you need!

# Resources:
# Sequel lab: https://github.com/flatiron-school/sequel-orms-ruby-003 as reference.
# Sequel migration docs: http://sequel.rubyforge.org/rdoc/files/doc/schema_modification_rdoc.html#label-Column+types

describe "migrations" do
  describe "creating tables" do
    before do
      # This runs your migrations for you with each test run
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/01_migrations"
    end

    context "01_migrations" do
      context "/01_create_cats.rb" do
        it "should create a table called cats with a primary key 'id'" do
          #TODO: create a migration for a table called cats with a primary key called id
          DB.tables.should include(:cats)
          column = DB.schema(:cats).first
          column.first.should == :id
          column.last[:primary_key].should == true
        end
      end

      context "/02_create_dogs.rb" do
        it "should create a 'dogs' table using the 'up' and 'down' methods" do
          #TODO: create a migration to create a dogs table with an up/down method pair
          DB.tables.should include(:dogs)

          migration_text = File.read("#{@path}/01_migrations/02_create_dogs.rb")
          migration_text.match(/up do/).should_not == nil
          migration_text.match(/down do/).should_not == nil

          Sequel::Migrator.run(DB, "#{@path}/01_migrations", target: 1)

          DB.tables.should_not include(:dogs)
        end
      end

      context "/03_create_hamsters.rb" do
        it "should create a 'hamsters' using the 'change' method" do
          # TODO: create a migration to create a hamsters table with the change method
          DB.tables.should include(:hamsters)
          migration_text = File.read("#{@path}/01_migrations/03_create_hamsters.rb")
          migration_text.match(/change do/).should_not == nil
          migration_text.match(/up do/).should == nil
          migration_text.match(/down do/).should == nil

          Sequel::Migrator.run(DB, "#{@path}/01_migrations", target: 2)

          DB.tables.should_not include(:hamsters)
        end
      end

      context "/04_create_homeworks.rb" do
        it "should create a 'homeworks' table with at least 4 different column data types" do
          # TODO: include 4 columns in your migration with 4 different types (e.g. String, Integer, DateTime, etc)
          col_types = DB.schema(:homeworks).collect { |col| col.last[:db_type] }.uniq
          (col_types.count >= 4).should == true
        end
      end
    end
  end
end

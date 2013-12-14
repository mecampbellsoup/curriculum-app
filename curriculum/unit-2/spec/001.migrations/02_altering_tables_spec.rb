require 'spec_helper'

# TODO: fill in the migrations in 02_migrations/ to alter the tables as described below
#       don't edit 01_create_students.rb. Remember that migrations should be additive.
#
#       Use https://github.com/flatiron-school/sequel-orms-ruby-003 as reference.

describe "migrations" do
  describe "altering tables" do
    before do
      @path = File.dirname(__FILE__)
      Sequel::Migrator.run DB, "#{@path}/02_migrations"
    end

    context "02_migrations" do
      context "/02_rename_students_firstname.rb" do
        it "should rename the firstname column to first_name" do
          new_col = DB.schema(:students).detect { |col| col.first == :first_name }
          new_col.should_not == nil
        end
      end

      context "/03_change_students_birth_date_type.rb" do
        it "should change birth_date to type timestamp" do
          birth_date_col = DB.schema(:students).detect { |col| col.first == :birth_date }
          birth_date_col.last[:db_type].should == "timestamp"
        end
      end
    end
  end
end

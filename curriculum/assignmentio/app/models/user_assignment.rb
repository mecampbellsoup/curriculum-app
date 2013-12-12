class UserAssignment < ActiveRecord::Base
  attr_accessible :assignment_id, :user_id, :status

  belongs_to :user
  belongs_to :assignment
  has_many :submissions

  
  def self.list_incomplete_past_due_date
    find(:all, :conditions => { :status => "incomplete"}) 
  end


  def overdue?
    self.assignment.due_date < Date.today if self.assignment.due_date
  end

  def self.check_submissions
    UserAssignment.all.each do |ua|
      if ua.submissions.detect {|s| s }
        ua.status = "Submitted"
      elsif ua.overdue?
      	ua.status = "Overdue"
      else 
      	ua.status = "Incomplete"
      end
      ua.save
    end
  end

  def submission
    submissions.order("created_at DESC").first
  end

  def is_overdue?
    status == "Overdue" || status == "overdue"
  end

  def is_incomplete?
    status == "Incomplete" || status == "incomplete"
  end

  def is_graded?
    status == "Graded" || status == "graded"
  end

  def is_submitted?
    status == "Submitted" || status == "submitted"
  end
end





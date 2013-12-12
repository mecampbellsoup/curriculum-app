class Submission < ActiveRecord::Base
  attr_accessible :content, :user_assignment, :submitted_file
  belongs_to :user_assignment

  mount_uploader :submitted_file, SubmittedFileUploader

  def add_to_assignment(user,assignment)
    user_assignment = UserAssignment.find_by_user_id_and_assignment_id(user,assignment)
    user_assignment.status = "Submitted"
    user_assignment.save
  end
  
  def self.zip_files(submissions)
    zipfile_name = "#{Rails.public_path}/download/assignments/assignment_#{submissions.first.user_assignment.assignment.id}.zip"
    File.delete(zipfile_name) if File.exists?(zipfile_name)
    zip_file = Zip::ZipFile.open(zipfile_name, Zip::ZipFile::CREATE) do |zipfile|
      submissions.each do |submission|
  	    file = submission.submitted_file
  	    if file.path
  		    filename = file.path.gsub(/.+\/[^\/]/,'')
  		    zipfile.add("assignment_#{submissions.first.user_assignment.assignment.id}/#{submission.user_assignment.user.name}/#{filename}", file.path) if file.url
  	    end
      end
    end
    File.chmod(0775, zipfile_name)
    zipfile_name
  end
end

module ApplicationHelper
  def file_submitted(submission)
    submission.submitted_file.url ? (link_to "Download Submission", submission.submitted_file.url) : "No file submitted" 
  end

def file_assignment(assignment)
    assignment.assignment_file.url ? (link_to "Download File", assignment.assignment_file.url) : "No file submitted" 
  end

end


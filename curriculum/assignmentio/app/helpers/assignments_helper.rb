module AssignmentsHelper
  def submitted_link(ua)
    if ua.is_submitted? || ua.is_graded?
      link_to("View Current Submission",assignment_submission_path(ua.assignment,ua.submission))
    end
  end
end

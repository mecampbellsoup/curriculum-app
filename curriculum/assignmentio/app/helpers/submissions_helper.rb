module SubmissionsHelper

  def submitted_any_files(user_assignments)
    !@user_assignments.collect(&:submission).compact.collect(&:submitted_file).collect(&:url).compact.empty?
  end
end

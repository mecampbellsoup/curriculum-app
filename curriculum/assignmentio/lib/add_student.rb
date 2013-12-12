module AddStudent
  def student_names=(students)
    accepts_names_from_comma_delimited_string(students)
  end
  def student_names
  end
  private
  def accepts_names_from_comma_delimited_string(string)
    string.split(",").each do |name|
    add_user(name.strip.downcase)
   end
  end
  def add_user(user)
    user = User.find_by_name(user) || User.find_by_email(user) unless user.is_a? User
    user_assignments.build(user_id: user.id, status: "incomplete") if user
  end
end

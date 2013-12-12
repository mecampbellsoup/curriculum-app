class Notifier < ActionMailer::Base
  default from: "services@flatironschool.com"

  def welcome(user)
    @user = user
    mail(to: user.email, subject: 'Welcome to Handrai.se!')
  end

  def notice_mail(issue, issue_creator, answer_creator)
    @issue = issue
    @issue_creator = issue_creator
    @answer_creator = answer_creator
    mail(to: @issue_creator.email, subject: 'Someone has responded to your post!')
  end

  def comment_mail(commentable, commentable_creator, comment_creator, comment)
    @commentable = commentable
    @commentable_creator = commentable_creator
    @comment_creator = comment_creator
    @comment = comment
    mail(to: @commentable_creator.email, subject: 'Someone has commented on your post!')
  end

  def answer_selected(issue, issue_creator, answerer)
    @issue = issue
    @issue_creator = issue_creator
    @answerer = answerer
    @user = @issue.user
    mail(to: answerer.email, subject: "#{@user.username} has selected your answer!")
  end

  def ping_instructor(issue, issue_creator)
    @instructor = User.find_by_is_instructor(true)
    @issue = issue
    @issue_creator = issue_creator
    mail(to: @instructor.email, subject: "#{@issue_creator.username} needs your help with an issue!")
  end
end

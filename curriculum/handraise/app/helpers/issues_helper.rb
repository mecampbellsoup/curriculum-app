module IssuesHelper

  def issue_owner_image_tag(issue)
    if issue.owner
      src = issue.owner.image_url || 'rails.png'
    else
      src = 'rails.png'
    end
    image_tag src, :size => "40x40", :class => "issue-nav-avatar"
  end

  def issue_owner_large_image_tag(issue)
    if issue.owner
      src = issue.owner.image_url || 'rails.png'
    else
      src = 'rails.png'
    end
    image_tag src, :size => "64x64", :class => "issue-nav-avatar"
  end

end

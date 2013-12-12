module ApplicationHelper
  def flash_class(level)
    case level
      when :notice then 'info'
      when :error then 'error'
      when :alert then 'warning'
      when :warning then 'warning'
    end
  end

  def render_escaped(arg)
    j(render arg)
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer:language)
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end

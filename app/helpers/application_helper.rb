module ApplicationHelper
  def markdown(content)
    return if content.nil?
    renderer = CustomRedcarpetHTML.new(hard_wrap: true, filter_html: true, safe_links_only: true)
    options = {
      tables: true,
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      space_after_headers: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end
end

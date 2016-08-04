module ApplicationHelper
  def quick_form(options = {}, &block)
    text = capture(&block)
    f = <<-HTML
      <h1>#{options[:action]}</h1>
      <form action="#{options[:url]}" method="post">
        <input type="hidden" name="_method" value="#{options[:method]}">
        <input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
    HTML
    f += text
    f += <<-HTML
        <input type="submit" class="btn btn-success" value="Save">
      </form>
    HTML
    f.html_safe
  end
end

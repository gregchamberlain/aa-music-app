module ApplicationHelper

  def form_gen(inputs, options = {})
    f = <<-HTML
      <h1>#{options[:action]}</h1>
      <form action="#{options[:url]}" method="post">
        <input type="hidden" name="_method" value="#{options[:method]}">
        <input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
    HTML
    inputs.each do |input|
      f += <<-HTML
        <label>
          #{input[:name].capitalize}
          <input type="#{input[:type]}" name="#{options[:model]}[#{input[:name]}]" value="#{input[:value]}">
        </label>
      HTML
    end
    f += <<-HTML
      <input type="submit">
    HTML
    f.html_safe
  end

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
        <input type="submit">
      </form>
    HTML
    f.html_safe
  end
end

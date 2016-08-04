module TracksHelper

  def ugly_lyrics(lyrics)
    lines = lyrics.split("\n")
    html = ""
    lines.each do |line|
      html += <<-HTML
        <pre>&#9835;  #{h(line)}</pre>
      HTML
    end
    html.html_safe
  end
end

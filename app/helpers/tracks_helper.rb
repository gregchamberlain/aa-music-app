module TracksHelper

  def ugly_lyrics(lyrics)
    lines = lyrics.split("\n")
    html = ""
    lines.each do |line|
      html += <<-HTML
        <p>&#9835;  #{h(line)}</p>
      HTML
    end
    html.html_safe
  end
end

# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def pretty_match
    string = h(@rubyxp.match_data.string.dup)

    string.sub!(h(@rubyxp.match_data[0])) { |match| "<span style=\"color:#ff0000\">#{match}</span>" }

  end

  def print_group_matches
    group_matches = ''

    @rubyxp.match_data.captures.each_with_index do |capture, index| 
      group_matches += "<span class=\"result-text\">#{index + 1}: #{capture}</span> #{capture_explanation(index+1)}<br />"
    end

    unless group_matches.blank?
      group_matches = "<span class=\"result-title\">Captures</span>:<br /><div class=\"indent-20\">#{group_matches}</div>"
    end

    group_matches
  end

  def print_sub
    output = h(@rubyxp.sub)
    source = "\"#{@rubyxp.string_comparison}\".sub( /#{@rubyxp.regexp}/#{@rubyxp.caret}, \"#{@rubyxp.replacement}\" )"
    
    str = <<-str
    <span class=\"result-title\">Sub output:</span><br />
    <div class="indent-20">
    <div class=\"result-text\">#{output}<br />
    #{link_to_function 'Show source', "$('#sub-source').toggle()"}
    <div id="sub-source" class="source" style="display:none"><code>#{source}</code></div></div></div>
    str
  end
  
  def print_gsub
    output = h(@rubyxp.gsub)
    source = "\"#{@rubyxp.string_comparison}\".gsub( /#{@rubyxp.regexp}/#{@rubyxp.caret}, \"#{@rubyxp.replacement}\" )"
    
    str = <<-str
    <span class=\"result-title\">Gsub output:</span><br />
    <div class="indent-20">
    <div class=\"result-text\"> #{output}<br/>
    #{link_to_function 'Show source', "$('#gsub-source').toggle()"}
    <div id="gsub-source" class="source" style="display:none"><code>#{source}</code></div></div></div>
    str
  end
  
  def capture_explanation(index)
    str = " (accessible via $#{index} or \\#{index} via sub/gsub)"
    content_tag(:span, str, :class => 'explanation')
  end
  
  def explanation(symbol)
    str = " (accessible via #{symbol})"
    content_tag(:span, str, :class => 'explanation')
  end
  
end

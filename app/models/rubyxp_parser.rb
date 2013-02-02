class RubyxpParser

  attr_accessor :expression, :regexp, :caret, :string_comparison, :replacement, :match_data, :sub, :gsub

  def initialize(params={})
    @regexp = params[:regexp]
    @caret = eval("//#{params[:caret]}").options #weird but I need to get the number
    @string_comparison = params[:string_comparison]
    @replacement = params[:replacement]

    @expression = Regexp.new(regexp, caret)
    @match_data = expression.match( string_comparison )

    unless replacement.blank?
      @sub = string_comparison.sub( expression, replacement )
      @gsub = string_comparison.gsub( expression, replacement )
    end
  end


end

class HomeController < ApplicationController
  
  def new
  end

  def create
    caret = ( params['caret'].blank? ? nil : params['caret'] )

    @rubyxp = RubyxpParser.new(
      :string_comparison => params['string_comparison'], 
      :regexp => params['regexp'],
      :caret => caret,
      :replacement => params['replacement']
    )
    
    render :layout => false

#  rescue Exception
#    render :text => 'Invalid expression / Try again'
  end
  
  def create_lang
    redirect_to "http://8d104bm851i9scfeh2s2h1bz06.hop.clickbank.net/"
  end

end

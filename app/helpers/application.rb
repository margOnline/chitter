module MakerHelpers

  def maker_signed_in
    @current_maker ||=Maker.get(session[:maker_id]) if session[:maker_id]
  end
  
end
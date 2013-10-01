module ChitterHelpers

  def maker_signed_in
    @current_maker ||=Maker.get(session[:maker_id]) if session[:maker_id]
  end

  # def get_details_of peep_maker
  #   @peep_maker = Maker.get(peep_maker)
  # end

end
module SnotelStation
  def retrieve(token)
    Snotel.daily(token[1..-1].to_sym)
  end
end

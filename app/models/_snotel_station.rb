module SnotelStation
  def retrieve(token)
    Snotel.daily(token)
  end
end

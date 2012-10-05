module VillasHelper
  def join_tags(villa)
    villa.tags.map { |t| t.name }.join(", ")
  end

  def no_villa?
    !Villa.first
  end
end

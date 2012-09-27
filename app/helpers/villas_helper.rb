module VillasHelper
  def join_tags(villa)
    villa.tags.map { |t| t.name }.join(", ")
  end
end

module VillasHelper
  def join_tags(villa)
    villa.tags.map { |t| t.name }.join(", ")
  end

  def no_villa?
    !Villa.first
  end
  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object,
                          child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to(name, '#', class: "add_fields",
            data: {id: id, fields: fields.gsub("\n", "")})
  end
end

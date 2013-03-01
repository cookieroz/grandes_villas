module ApplicationHelper
  def full_title(page_title)
    base_title = "Villa Rental Spain"
    if page_title.empty?
      return base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", villa_form: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def no_dest?
    !Destination.first
  end

  def new_message
    Message.new
  end

  def no_res?
    !Reservation.first
  end

  #def javascript(*files)
  #  content_for(:head) { javascript_include_tag(*files) }
  #Send
end

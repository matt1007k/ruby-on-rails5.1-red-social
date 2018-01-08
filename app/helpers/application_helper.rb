module ApplicationHelper
  #helper de crear cuenta de devise
  def resource
    @resource ||= User.new
  end

  def resource_name
    :user
  end

  def resource_class
    User
  end

  # Helper para imagenes con border circulo, con url y tamaño como parametros
  def circle_img url, size=50
    # content_tag declara etiqueta div vació("")
    div = content_tag :div, "", class: "circle cover", style:"height:#{size}px;width:#{size}px;background-image: url(#{url})"
    
  end
end

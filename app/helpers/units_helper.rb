module UnitsHelper
  $kinds = ['самолёт', 'вагон', 'автобус', 'пароход']
  $categories = [['Эконом-класс', 'Бизнес-класс', 'Первый класс'],['Плацкарт нижнее небоковое', 'Плацкарт верхнее небоковое', 'Плацкарт нижнее боковое', 'Плацкарт верхнее боковое', 'Сидячее', 'Купе нижнее', 'Купе верхнее', 'Люкс']]

  def show_list(items)  
    s = "<table>"
    items.each do |item|
      s += "<tr><td>#{item.description}</td><td>#{button_to 'Подробнее', :action => 'view', :id => item.id}</td></tr>"
    end 
    s += "</table>"
  end
  
  def get_transport(transport)
    $kinds[transport]
  end
  
  def get_category(category, transport)
    $categories[transport][category]
  end
  
  def split_categories(places, transport)
    cats = Array.new
    $categories[transport].size.times{cats << []}
    places.each{|p| cats[p.category] << p}
    cats
  end
  
  def get_categories_places(places, transport)
    s = "<ul>"
    places_cat = split_categories(places, transport)
    $categories[transport].each_index do |i|           
      s += "<li>#{$categories[transport][i]} - #{places_cat[i].size}: " + places_cat[i].map{|p| p = p.number}.join(', ') + ".</li>" if places_cat[i].size > 0
    end
    s += "</ul>"
  end
end

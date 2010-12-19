module UnitsHelper
  $units = ['самолёт', 'вагон', 'автобус', 'пароход']
  $categories = [['Эконом-класс', 'Бизнес-класс', 'Первый класс'],['Плацкарт нижнее небоковое', 'Плацкарт верхнее небоковое', 'Плацкарт нижнее боковое', 'Плацкарт верхнее боковое', 'Сидячее', 'Купе нижнее', 'Купе верхнее', 'Люкс']]

  def show_list(items)  
    s = "<table>"
    items.each do |item|
      s += "<tr><td>#{item.description}</td><td>#{button_to 'Подробнее', :action => 'view', :id => item.id}</td></tr>"
    end 
    s += "</table>"
  end
  
  def get_transport(transport)
    $units[transport]
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
  
  def get_categories_places_total(places, transport)
    s = "<ul>"
    places_cat = split_categories(places, transport)
    $categories[transport].each_index do |i|
      free = 0
      places_cat[i].each{|p| free+=1 if p.purchased == false}         
      s += "<li>#{$categories[transport][i]} - всего #{places_cat[i].size}, свободно #{free};</li>" if places_cat[i].size > 0
    end
    s += "</ul>"
  end

  def get_wagon_places(wagon, places)
    ps = []
    places.each{|p| ps << p if p.wagon_number == wagon}
    get_categories_places_total(ps, 1)
  end

  def get_single_category_places(places)
    s = 0
    places.each{|i| s+=1 if i.purchased == false}
    "Всего #{places.size}, свободно #{s}."
  end
end

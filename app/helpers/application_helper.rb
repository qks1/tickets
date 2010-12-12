# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  $kinds = ['Самолёт', 'Поезд', 'Автобус', 'Пароход']
  $categories = [['Эконом-класс', 'Бизнес-класс', 'Первый класс'],['Плацкарт нижнее небоковое', 'Плацкарт верхнее небоковое', 'Плацкарт нижнее боковое', 'Плацкарт верхнее боковое', 'Сидячее', 'Купе нижнее', 'Купе верхнее', 'Люкс']]
  

  def show_errors(errors)
    return '' if errors.size == 0
    result = "<div><h4>Ошибки:</h4><ul>"
    errors.each{|e| result << "<li>#{e}</li>" }
    result << "</ul></div>"
    return result
  end
  
  def get_transport(tr_id)    
    $kinds[tr_id]
  end

  def kinds_list(field, selected = 0)
    ks = []
    $kinds.each_index{|i| ks << [$kinds[i], i]}
    select_tag(field, options_for_select(ks, selected))
  end
  
  def providers_list(field, selected = 0)
    ps = []
    Provider.find(:all).each{|i| ps << [i.company_name, i.id]}
    select_tag(field, options_for_select(ps, selected))
  end
  
  def stations_list(field, transport)
    ss = []
    Station.find(:all, :conditions => "transport = #{transport}").each{|i| ss << [i.name, i.id]}
    select_tag(field, options_for_select(ss))
  end

  def units_list(field, transport)
    ws = []
    Unit.find(:all, :conditions => "transport = #{transport}").each{|i| ws << [i.description, i.id]}
    select_tag(field, options_for_select(ws))
  end
    
end

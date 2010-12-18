# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  $kinds = ['Самолёт', 'Поезд', 'Автобус', 'Пароход']
  $categories = [['Эконом-класс', 'Бизнес-класс', 'Первый класс'],['Плацкарт нижнее небоковое', 'Плацкарт верхнее небоковое', 'Плацкарт нижнее боковое', 'Плацкарт верхнее боковое', 'Сидячее', 'Купе нижнее', 'Купе верхнее', 'Люкс']]
  @t=[]

  def show_errors(errors)
    return '' if errors.size == 0
    result = "<div><h4>Ошибки:</h4><ul>"
    errors.each{|e| result << "<li>#{e}</li>" }
    result << "</ul></div>"
    return result
  end
  
  def get_kind(tr_id)    
    $kinds[tr_id]
  end

	def is_operator?
		unless !session[:user].nil?
			session[:user].typ == 'Operator' ? true : false
		end
		return false
	end

	def user_type
		session[:user].typ
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

  def cities_list(field)
    cs = []
    Station.find(:all).each{|i| cs << i.city}
    cs = cs.uniq.sort.each{|i| i = [i, i]}
    select_tag(field, options_for_select(cs))
  end

  def all_stations_list(field)
    ss = []
    Station.find(:all).each{|i| ss << [i.name, i.id]}
        select_tag(field, options_for_select(ss))
  end

  def categories_list(field, transport)
    ks = []
    $categories[transport].each_index{|i| ks << [$categories[transport][i], i]}
    select_tag(field, options_for_select(ks))
  end
  
end

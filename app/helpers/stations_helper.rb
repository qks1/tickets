module StationsHelper

  $kinds = ['Самолёт', 'Поезд', 'Автобус', 'Пароход']
  
  def get_transport(tr_id)    
    $kinds[tr_id]
  end

  def kinds_list(field, selected = 0)
    ks = []
    $kinds.each_index{|i| ks << [$kinds[i], i]}
    select_tag(field, options_for_select(ks, selected))
  end
  
end

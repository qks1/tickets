class Unit < ActiveRecord::Base
  validates_presence_of :transport,
    :message => 'Должен быть указан вид транспорта'
  validates_inclusion_of :transport,
    :in => 0..3,
    :message => 'Возможно только 4 вида транспорта'
  validates_presence_of :description,
    :message => 'Должно присутствовать описание'
  validates_format_of :image,
    :with => %r{\.(gif|jpg|png)$}i,
    :allow_nil => true,
    :message => 'Ссылка должна указывать на изображение'
    
  has_many :wagon_unit_places
    
  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end

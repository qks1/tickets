class Provider < ActiveRecord::Base
  validates_presence_of :company_name,
    :message => 'Должно быть указано имя компании'
  validates_presence_of :jur_address,
    :message => 'Должен быть указан юридический адрес'
  validates_presence_of :fact_address,
    :message => 'Должен быть указан фактический адрес'
  validates_presence_of :reg_number,
    :message => 'Должен быть указан регистрационный номер фирмы'
  validates_presence_of :phone,
    :message => 'Должен быть указан номер телефона'
  validates_presence_of :email,
    :message => 'Должен быть указан адрес электронной почты'
    
  def before_validation()
    self.attribute_names.each do |n|
      self[n] = self[n].strip if self[n].kind_of?(String)
    end
  end
end

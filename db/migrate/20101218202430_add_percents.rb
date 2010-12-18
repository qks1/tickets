class AddPercents < ActiveRecord::Migration
  def self.up
    ps = [0, 0.3, 1, 0, 0.3, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0.5, 1]
    ps.each_index do |i|
      rd = RouteStation.find(i+1)
      rd.update_attributes(:percents => ps[i])
      rd.save
    end
  end

  def self.down
    (1..RouteStation.find(:all).size).each do |i|
      rd = RouteStation.find(i)
      rd.update_attributes(:percents => 0)
      rd.save
    end
  end
end

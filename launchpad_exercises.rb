#!/usr/bin/env ruby
class Vehicle
  attr_accessor :speed, :color
  @@vehicles = 0
  def initialize(color)
    @color = color
    @speed = 0
    @@vehicles += 1
  end

  def self.number_of_vehicles
    p @@vehicles
  end

  def speed_up(speed)
    @speed += speed
  end

  def slow_down(speed)
    @speed -= speed
  end

  def shut_off
    @speed = 0
  end

  def current_speed
    p "You are travelling at #{speed}"
  end
end

class MyCar < Vehicle
  include Customization
  GAS = 10
  attr_reader :year, :model
  def initialize(year, color, model)
    super(color)
    @speed = 0
    @year = year
    @color = color
    @model = model
  end

  def self.gas_mileage(miles)
    p "Your MPG is #{GAS / miles}"
  end

  def to_s
    p "Your #{color} #{year} #{model} is travelling at #{@speed}mph. It is #{age} years old."
  end

  private

  def age
    Time.now.year - year
  end
end

class MyTruck < MyCar
  STORAGE_CAPACITY = 300 # lbs
end

module Customization
  def spray_paint(color)
    p "Your vehicle is now #{color}"
    self.color = color
  end
end

ford = MyTruck.new(1998, 'Blue', 'F150')
toyota = MyCar.new(2004, 'Green', 'Prius')
ford.speed_up(35)
ford.shut_off
ford.spray_paint('Red')
ford.to_s

Vehicle.number_of_vehicles

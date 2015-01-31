module Unused
  class ModelField < ActiveRecord::Base
    belongs_to :model, polymorphic: true
    attr_accessible :data, :model, :model_id, :model_type

    # def initialize
    #   raise "ModelField cannot be initialized" if self.class == ModelField
    # end

    def self.new
      raise 'Doh! You are trying to write Java in Ruby!' if self.class == ModelField
    end

    #self.table_name = nil

    # def initialize
    #   super
    #   #self.class.new.data
    # end
  end
end
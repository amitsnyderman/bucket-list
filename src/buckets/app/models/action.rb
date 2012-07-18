class Action < ActiveRecord::Base
  belongs_to :user
  belongs_to :bucket
  
  def execute(item)
    # Implement in subclasses
    puts "Not implemented: #{self.class}::execute()"
  end
end

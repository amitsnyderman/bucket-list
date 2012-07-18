class Action::Email < Action
  def execute(item)
    EmailActionMailer.execute(self, item).deliver
  end
end

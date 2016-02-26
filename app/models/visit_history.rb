class VisitHistory < ActiveRecord::Base
  def self.visit(user_id, content_id, time, visit_id)
    vh = self.find_or_initialize_by :user_id => user_id, :content_id => content_id
    vh.update! :updated_at => time, :visit_id => visit_id
  end

  def self.reset
    self.delete_all
  end
end

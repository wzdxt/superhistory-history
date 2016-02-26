class VisitHistory < ActiveRecord::Base
  establish_connection :visithistory
  visit_history = self.arel_table
  scope :user, -> (user_id){where(visit_history[:user_id].eq(user_id)) }
end

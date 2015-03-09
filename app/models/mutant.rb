class Mutant < ActiveRecord::Base

  has_many :assignations, dependent: :delete_all
  has_many :tasks, -> { order priority: :desc }, through: :assignations

  has_many :membership
  has_many :teams, through: :membership

  acts_as_taggable
  alias_method :powers, :tag_list
  alias_method 'powers=', 'tag_list='

  def image_in_asset
    self.image.nil? ? nil : 'profiles/mutants/' + self.image.to_s
  end

  def is_professor_xavier
    self.id == 1
  end

  def unlink_from_team(team_id)
      tasks_unassigned = []
      Team.find(team_id).tasks.each do |task|
        assignation = task.assignations.find_by_mutant_id(self.id)
        if assignation
          tasks_unassigned << task
          assignation.destroy
        end
      end
      membership = self.membership.find_by_team_id(team_id)
      membership.destroy if membership
      tasks_unassigned
  end

  def unlink_from_task(task_id)
      self.assignations.delete(task_id)
  end

  class << self
    alias_method :with_power, :tagged_with
  end

end

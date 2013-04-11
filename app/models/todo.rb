class Todo < ActiveRecord::Base
  attr_accessible :title, :body, :list, :status

  belongs_to :list

  scope :incomplete, where(status: 0)
  scope :complete, where(status: 1)
  scope :in_progress, where(status: 2)
  scope :moved, where(status: 3)
  scope :deleted, where(status: 4)
  scope :postponed, where(status: 5)
  scope :important, where(status: 6)

  @@statuses = [:incomplete, :complete, :in_progress, :moved, :deleted, :postponed, :important]

  def status?
    @@statuses[self.status]
  end

  def self.statuses
    count = -1
    @@statuses.map { |status| [status, count += 1] }
  end

end

class Admin::UserSearchForm

  include ActiveModel::Model

  attr_accessor :term, :status, :group

  validates :term, length: { minimum: 2 }, allow_blank: true
  validates :status, inclusion: { in: %w(active inactive) }, allow_blank: true

  def options_for_status
    @options_for_status ||= [['Active', :active], ['Inactive', :inactive]]
  end

  def options_for_group
    @options_for_group ||= Group.all
  end

  def submit
    return false if invalid?
    @results = Person.all
    @results = @results.where('LOWER(name) LIKE LOWER(?)', "#{term}%") if term.present?
    @results = @results.where(status: status) if status.present?
    @results = @results.where(group: group) if group.present?
    @results
  end

  def results
    @results || []
  end

end

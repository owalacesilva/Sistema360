class PointsReportQuery < ApplicationQuery
  attr_reader :relation, :users, :filters

  def initialize(relation:, filters:)
    @relation = relation
    @filters = filters
  end

  def call
    scope = relation.point_records

    apply_filter(scope, :status)
      .yield_self { |scope| apply_filter(scope, :name) }
  end

  private

  def apply_filter(scope, filter)
    return scope if filters[filter].blank?

    send("filter_by_#{filter}", scope, filters[filter])
  end

  def filter_by_status(scope, value)
    scope.where(status: value)
  end

  def filter_by_name(scope, value)
    scope.where(first_name: value)
  end
end



class TotalValidator < ActiveModel::Validator


  def validate(record)
    unless record.total.match?(/\A[+-]?\d+\.?\d?/)
      record.errors[:total] << "Total must be a number"
    end
  end
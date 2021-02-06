

class TotalValidator < ActiveModel::Validator


  def validate(record)
    unless record.total.to_s.match?(/\A[+-]?\d+\.?\d?/)
      record.errors[:total] << "Total must be a number"
    end
  end

end
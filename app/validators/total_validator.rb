

class TotalValidator < ActiveModel::Validator


  def validate(record)
    if record.total.to_s.match?(/0\.0/)
      record.errors[:total] << "must be a number that is not 0"
    end
  end

end
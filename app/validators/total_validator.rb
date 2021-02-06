

class TotalValidator < ActiveModel::Validator


  def validate(record)
    if record.total.to_s.match?(/\A0\.0\z/)
      record.errors[:total] << "must be a number that is not 0"
    end
  end

end
class FutureDateValidator < ActiveModel::EachValidator
  def validate_each(record, attr_name, value)
    if !value.nil?
      unless value >= Time.now && value.today?
        record.errors.add(attr_name, :future_date, options.merge(value: value))
      end
    end
  end
end

module ActiveModel::Validations::HelperMethods
  def validates_future_date(*attr_names)
    validates_with FutureDateValidator, _merge_attributes(attr_names)
  end
end
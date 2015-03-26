class CoverValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if record.send("#{attribute}?".to_sym)
      dimensions = Paperclip::Geometry.from_file(value.queued_for_write[:original].path)
      min_size = options[:min_size]

      record.errors[attribute] << "L'image doit être carrée" unless dimensions.width.between?(dimensions.height*0.9, dimensions.height*1.1)
      record.errors[attribute] << "L'image doit être d'au moins #{min_size}px, #{min_size}px" unless dimensions.height >= min_size || dimensions.width >= min_size
    end
  end
end
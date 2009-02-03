module EmailValidator
  module ClassMethods
    def validates_email(field, opts = {})
      validates_format_of field, opts.merge(:with => /[a-z0-9!\#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!\#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|com|edu|org|net|gov|mil|biz|info|mobi|name|tel|aero|jobs|museum)\b/i)
    end
  end
  
  def self.included(model)
    model.extend(ClassMethods)
  end
end

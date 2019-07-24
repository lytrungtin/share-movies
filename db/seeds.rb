unless User.any?
  tintin = User.new(email: "trungtin.sotech@gmail.com", password: "123456")
  tintin.save!
  Rails.logger.info 'Tintin already created!'
end
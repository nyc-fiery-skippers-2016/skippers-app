class Skipper < ActiveRecord::Base
  has_many :skipper_skills
  has_many :skills, through: :skipper_skills

  include BCrypt

  def self.authenticate(name, password)
    skipper = self.find_by(name: name)
    if skipper && skipper.password == password
      return skipper
    else
      false
    end
  end

  def password
    @password ||= Password.new(self.password_digest)
  end

  def password=(plaintext)
    @password = Password.create(plaintext)
    self.password_digest = @password
  end
end

# skipper = Skipper.create({name: "Sam", password: "password", wingspan:60})
# skipper.name=("Sam")
# skipper.password = "password"
# skipper.wingspan = 60
# skipper.save
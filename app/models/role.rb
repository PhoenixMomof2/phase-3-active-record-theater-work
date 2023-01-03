class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    # returns an array of names from the actors associated with this role
    auditions.map {|x| x.actor}
  end

  def locations
    # returns an array of locations from the auditions associated with this role
    auditions.map {|x| x.location}
  end

  def lead 
    # returns the first instance of the audition that was hired for this role or... 
    # returns a string 'no actor has been hired for this role'

    auditions.find_by(hired: true) || "no actor has been hired for this role"
  end

  def understudy
    # returns the second instance of the audition that was hired for this role... 
    # or returns a string 'no actor has been hired for understudy for this role'

    auditions.where(hired: true).second || "no actor has been hired for this role"
  end
end
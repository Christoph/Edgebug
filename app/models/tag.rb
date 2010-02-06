class Tag < ActiveRecord::Base
  has_and_belongs_to_many :testcases



  def self.search(query)
    order = 'name desc'
    unless query.to_s.strip.empty?
      keywords = query.split.map { |k| "%#{k}%" }
      find(:all, :conditions => [(['name like ?']*keywords.length).join(" and "), keywords].flatten, :order => order)
    else
      find(:all, :order => order)
    end
  end
end

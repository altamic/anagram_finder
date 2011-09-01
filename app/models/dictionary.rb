class Dictionary < ActiveRecord::Base
  before_save :set_name

  attr_accessor :name

  has_attached_file :file, :styles => { :small => "150x150>" },
    :url  => "/assets/uploads/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/uploads/:id/:style/:basename.:extension"

  validates_attachment_presence :file

  private
  def set_name
    self.name = self.document_file_name
    true
  end
end

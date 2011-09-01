class Dictionary < ActiveRecord::Base
  before_save :set_name

  attr_accessor :document_file_name

  has_attached_file :document,
    :url  => "/uploads/:id/:basename.:extension",
    :path => ":rails_root/public/uploads/:id/:basename.:extension"

  validates_attachment_presence :document

  private
  def set_name
    self.name = document_file_name
    true
  end
end

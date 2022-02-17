class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate
  belongs_to :kind do 
    link(:kind) { contact_kind_path(object.kind_id) }
  end
  has_many :phones do 
    link(:phones) { contact_phones_path(object.id) }
  end
  has_one :address do
    link(:address) { contact_address_path(object.id) }
  end

  def attributes(*args)
    h = super(*args)
    # h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end
end

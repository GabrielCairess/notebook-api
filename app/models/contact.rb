class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  scope :most_recent, ->{ order('created_at DESC') }

  def as_json(options={})
    super(root: true,
      except: [:created_at, :updated_at],
      include: [{ kind: { only: :description }}, { address: {only: [:id, :city, :street]}}, { phones: {only: [:id, :number]}}])
  end

  def birthdate_br
    self.birthdate.strftime("%d/%m/%Y") unless self.birthdate.blank?
  end
end

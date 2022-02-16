class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  accepts_nested_attributes_for :phones

  scope :most_recent, ->{ order('created_at DESC') }

  def as_json(options={})
    super(root: true,
      except: [:created_at, :updated_at],
      include: [{ kind: { only: :description }}, { phones: {only: [:number, :contact_id]}}])
  end

  def birthdate_br
    self.birthdate.strftime("%d/%m/%Y") unless self.birthdate.blank?
  end
end

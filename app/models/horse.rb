# == Schema Information
#
# Table name: horses
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  nick_name           :string(255)
#  sex                 :string(255)
#  fertility           :string(255)
#  foaling_date        :datetime
#  color               :string(255)
#  date_of_birth       :datetime
#  markings            :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  avatar              :string(255)
#  breed               :string(255)
#  registration_number :string(255)
#  org_numbers         :string(255)
#  emergencies         :text
#  comments            :text
#

class Horse < ActiveRecord::Base
  belongs_to :user

  mount_uploader :avatar, AvatarUploader

  has_many :photos
  has_many :documents

  validates :name, :nick_name, presence: true

  def self.convert_from_base64(image_data)
    data = StringIO.new(Base64.decode64(image_data))
    data.class.class_eval { attr_accessor :original_filename, :content_type }

    tmp = Tempfile.new("base64")
    File.open(Rails.root.join('tmp',tmp).to_s, 'w:binary') do |f|
      f.write(Base64.decode64(data))
    end
    # tmp.write(data.read)
    # tmp.close

    # only on *nix
    data.content_type = IO.popen(["file", "--brief", "--mime-type",tmp.path],
      in: :close, err: :close).read.chomp
    data.original_filename = "picture." + data.content_type.split("/").last

    data
  end
end

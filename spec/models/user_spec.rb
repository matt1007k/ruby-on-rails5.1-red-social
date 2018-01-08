# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string           default(""), not null
#  name                   :string
#  last_name              :string
#  bio                    :text
#  uid                    :string
#  provider               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  cover_file_name        :string
#  cover_content_type     :string
#  cover_file_size        :integer
#  cover_updated_at       :datetime
#

require 'rails_helper'

RSpec.describe User, type: :model do
  #validar si el username es requerido
  it {should validate_presence_of :username}
  #validar si el username es unicó
  it {should validate_uniqueness_of :username}
  #validar si el caracteres 3 a 12
  it {should validate_length_of(:username).is_at_least(3).is_at_most(12)}

  #prueba para validar al username
  describe "#validate_username_regex" do
    # usar FactoryGirl para crear el usuario
    # con build solo hacemos instancia de User.new
    # con create hacemos User.new u user.save a la DB
    let(:user){FactoryGirl.build(:user)}
    #pide que el username no puede inicar con números
    it "should not allow username with numbers at the beginning" do
      # valid que el username es false, es decir que inicia con un número
      user.username = "9sadasd"
      # valid? => false
      # errors =>no este vacío
      # errors.full_messages => El username debe iniciar con una letra
      expect(user.valid?).to be_falsy
    end
    #pide que el username no contenga caracteres especiales
    it "should not contain special characters" do
      user.username = "sdsd*"
      # valid? => false
      # errors =>no este vacío
      # errors.full_messages => username no contenga caracteres especiales
      expect(user.valid?).to be_falsy
    end
  end

end

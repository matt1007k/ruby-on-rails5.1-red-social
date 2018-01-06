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

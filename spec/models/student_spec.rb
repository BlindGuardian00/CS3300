require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'is database authenticable' do
    student = Student.create(
       email: 'test@example.com', 
      password: 'password123',
      password_confirmation: 'password123'
    )
    expect(student.valid_password?('password123')).to be_truthy
  end
end
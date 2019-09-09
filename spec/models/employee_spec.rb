require 'rails_helper'

RSpec.describe Employee, type: :model do
  context 'validation tests' do
    it { should validate_presence_of :name}
    it 'ensures name presence' do
      employee=Employee.new(age: "34", designation: "wedcw", company: "Tata").save
      expect(employee).to eql(false)
    end
    it 'ensures age presence' do
      employee=Employee.new(name:"Debu", designation: "wedcw", company: "Tata").save
      expect(employee).to eql(false)
    end
    it 'ensures company presence' do
      employee=Employee.new(name: "Debu",age:"34",designation: "wedcw").save
      expect(employee).to eql(false)
    end
    it 'should save successfully' do
      employee=Employee.new(name: "Debu",age: "34", designation: "wedcw", company: "Tata").save
      expect(employee).to eql(true)
    end
  end
end

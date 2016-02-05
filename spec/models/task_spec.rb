require 'rails_helper'

RSpec.describe Task, type: :model do

  before :each do
    now = Time.zone.now
    @task = FactoryGirl.build(:task, created_at: now, updated_at: now)
  end


  describe 'validations' do
    it 'should be valid' do
      expect(@task).to be_valid
    end

    it 'should not be valid without title' do
      @task.title = nil
      expect(@task).to_not be_valid
    end

    it 'should not be valid with not number' do
      @task.priority = 'd'
      expect(@task).to_not be_valid
    end

    it 'should not be valid with date in the past' do
      @task.due_date = Date.yesterday
      expect(@task.save).to eq(false)
    end

    it 'should be valid with today date and future date' do
      @task.due_date = Date.today
      expect(@task.save).to eq(true)
    end

    it 'should be valid with future date' do
      @task.due_date = Date.tomorrow
      expect(@task.save).to eq(true)
    end
  end
end
require 'spec_helper'

describe SchemaPlus::DbDefault do

  let(:default_value) { "This is the default value" }

  let(:migration) { ::ActiveRecord::Migration }

  before(:each) do
    class User < ::ActiveRecord::Base ; end
    create_table(User, :alpha => { :default => default_value }, :beta => {})
  end

  context "uses db default value" do

    it "when creating a record with DB_DEFAULT" do
      User.create!(:alpha => ActiveRecord::DB_DEFAULT, :beta => "hello")
      expect(User.last.alpha).to eq(default_value)
      expect(User.last.beta).to eq("hello")
    end

    it "when updating a record with DB_DEFAULT" do
      u = User.create!(:alpha => "hey", :beta => "hello")
      u.reload
      expect(u.alpha).to eq("hey")
      expect(u.beta).to eq("hello")
      u.update_attributes(:alpha => ActiveRecord::DB_DEFAULT, :beta => "goodbye")
      u.reload
      expect(u.alpha).to eq(default_value)
      expect(u.beta).to eq("goodbye")
    end

  end

  protected

  def create_table(model, columns_with_options)
    migration.suppress_messages do
      migration.create_table model.table_name, :force => :cascade do |t|
        columns_with_options.each_pair do |column, options|
          t.send :string, column, options
        end
      end
      model.reset_column_information
    end
  end
end


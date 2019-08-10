class AddOutcomeToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :outcome, :string
  end
end

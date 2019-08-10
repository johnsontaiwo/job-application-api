class AddFeedbackToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :feedback, :string
  end
end

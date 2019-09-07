class JobSerializer < Activemodel::JobSerializer
attributes :title, :date_applied, :status, :feedback, :outcome, :company
belongs_to :user

end
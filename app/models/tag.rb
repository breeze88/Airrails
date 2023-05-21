class Tag < ActiveRecord::Base
    # Add any associations or validations here
    # belongs_to :album, class_name: "Album", foreign_key: "report_id"
    belongs_to :report
end
  
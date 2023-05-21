class Song < ActiveRecord::Base
    # Add any associations or validations here
    # belongs_to :album, class_name: "Album", foreign_key: "report_id"
   # belongs_to :report
    belongs_to :report, class_name: "User", foreign_key: "validatiertdurch"


    belongs_to :album, foreign_key: "report_id"

 


      # def self.with_parent_album_info
      #   sql = <<-SQL
      #     SELECT s.id, s.report_id, a.id AS album_id, a.report_id AS album_report_id  
      #     FROM songs s
      #     JOIN albums a ON s.report_id = a.report_id
      #   SQL
      #   self.find_by_sql(sql)
      # end
    
     

end
  
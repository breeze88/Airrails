class Album < ActiveRecord::Base

  enum :category, { presatoshi: 0, pending: 1, active: 2, discontinued: 3}, default: :presatoshi
  

    # has_many :songs, class_name: "Song", foreign_key: "report_id", dependent: :destroy
    belongs_to :user, foreign_key: :validatiertdurch
    def validate_code(code, user_id)
        if code == geheim && !gebraucht
          update(gebraucht: true, validatiertdurch: user_id, category: 1)
          return true
        else
          return false
        end
    end

   # belongs_to :report
    belongs_to :report, class_name: "User", foreign_key: "validatiertdurch"

   # has_many :songs, class_name: "Song", foreign_key: "report_id", dependent: :destroy

    has_many :songs, foreign_key: "report_id"



    #def human_status
    #  Album.categories.key(category).to_s.humanize
   # end

   def self.human_status_options
    categories.keys.map { |c| [human_status(c), c] }
  end

  def self.human_status(status)
    I18n.t("activerecord.attributes.album.categories.#{status}")
  end



end

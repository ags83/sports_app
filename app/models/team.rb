class Team < ActiveRecord::Base
 attr_accessible :name, :photo
 has_one  :game_teamA, :class_name => 'Game', :foreign_key => 'teamA'
 has_one  :game_teamB, :class_name => 'Game', :foreign_key => 'teamB'
 has_many   :tips 
has_attached_file :photo,
    :styles => {
      :thumb=> "80x80#",
      :small  => "150x150>" }
	  
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

end

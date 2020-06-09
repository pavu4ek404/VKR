class ApplicationRecord < ActiveRecord::Base
  
  self.abstract_class = true

  Peopl.joins(:profs);


end

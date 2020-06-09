class MainsController < ApplicationController
    def nav_link_to(link_text, link_path, options = nil)
        class_name = current_page?(link_path) ? 'active' : ''
    
        content_tag(:li, :class => class_name) do
          link_to link_text, link_path, options
        end
      end

      def index 
        @allpeopl = Allpeopl.joins(:peopl,:sert,:prof).take(3)
        @work = Work.joins( [well: :cut],:peopl).take(3)
        @deli = Deliverie.joins([contract: :organisation],:storehouse).take(3)
      end     
end

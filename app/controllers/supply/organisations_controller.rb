class Supply::OrganisationsController < Supply::SupplyController
    def index
        @org=Organisation.all
    end
end

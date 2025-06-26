class HistoricalsController < ApplicationController
    def index 
         authorize Historical    
        @historicals= policy_scope(Historical)
    end
end

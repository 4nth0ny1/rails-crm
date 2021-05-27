class Kpi
    def self.calls(user)
        user.connections.calls_today.count/40.0 * 100
    end 

    def self.emails(user)  
        user.connections.emails_today.count/40.0 * 100
    end 

    def self.opps(user)
        user.opportunities.daily_opps.count/5.0 * 100
    end 
  
    def self.accts(user)
        user.accounts.daily_accts.count/5.0 * 100
    end    

end 
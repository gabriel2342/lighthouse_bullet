
Organization
    rails g model Organization team:references name:string

    bin/super-scaffold crud Organization Team name:text_field 
    has_many :municipalities


Municipality
    rails g model Municipality organization:references name:string url:string

    bin/super-scaffold crud Municipality Organization,Team name:text_field url:text_field
    has_many :serviceproviders

    ServiceProvider 
        rails g model service_provider name:string about:text street:string city:string state:string zip:string contact_person:string phone:string email:string url:string municipality:references
            bin/super-scaffold crud ServiceProvider Municipality,Organization,Team name:text_field about:text_area street:text_field city:text_field state:text_field zip:text_field contact_person:text_field phone:phone_field email:email_field url:text_field
            
            has_many :hours
            has_many :services
            belongs_to :municipality
       
            Hour
                rails g model ServiceProviders::Hour municipality:references name:string
                bin/super-scaffold crud ServiceProviders::Hour Municipality,Organization,Team name:text_field 
    

            ProviderHour
            rails g model ServiceProvider::ProviderHour service_provider:references hour:references 


            bin/super-scaffold join-model ServiceProvider::ProviderHour Municipality,Team service_provider_id{class_name=ServiceProvider} hour_id{class_name=ServiceProvider::Hour }


            bin/super-scaffold crud-field ServiceProvider hour_ids:super_select{class_name=ServiceProvider::Hour}

             in app/models/project.rb add
                    def valid_hours
                        team.service_provider_hours
                    end

            
            Service
                rails g model ServiceProvider::Service municipality:references name:string
                bin/super-scaffold crud ServiceProvider:Service name:text_field
            
            ServiceProviderService
                rails g model ServiceProvider::ServiceProviderService service_provider:references service:references
            

                bin/super-scaffold join-model ServiceProvider::ServiceProviderService service_provider_id{class_name=ServiceProvider} service_id{class_name=ServiceProvider::Service }

                bin/super-scaffold crud-field ServiceProvider service_ids:super_select{class_name=ServiceProvider::Service}

                in app/models/project.rb add
                    def valid_services
                        team.service_provider_services
                    end








     Hotline
            rails g model hotline hotline:string
            belongs_to :municipality
    
    Support_Groups???


ResourceGuide
    rails g model resource_guide team:references  municiplaity:references name:string
        has_many :service_providers
        has_many :hotlines
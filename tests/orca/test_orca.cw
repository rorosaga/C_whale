orca {
    create{   
            image_name->"my_simple_image";
            from->"alpine";
        }
     };

orca{
    create{
        image_name->"my_app_image"; 
        from->"node:14"; 
        commands->"npm install";
        }
    };

orca{
    create{
        image_name->"full_feature_image";
        from->"ubuntu:latest"; 
        commands->"apt-get update && apt-get install -y vim";
        }
    };


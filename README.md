# MI_assignment

## SETTING UP BACK-END:
### 1.installing 
        docker:https://docs.docker.com/engine/install/ubuntu/
        docker-compose:https://docs.docker.com/compose/install/
        
### 2.Building and running back-end
        i. cd into MI_assignment/coupon-app-backend/
        ii. sudo docker-compose up --build
        iii. sudo docker exec -ti coupon-app sh -c "python manage.py makemigrations"
        iv. sudo docker exec -ti coupon-app sh -c "python manage.py migrate"
## SETTING UP FRONT-END
        i.download flutter pluggin on android studio
        ii.setup dart SDK on android studio
     
     (NOTE:
        Front-end mobile application is connecting to the IP address of my local wifi hence we have to change it to the IP address of your wifi
        STEPS TO DO SO:
            1.navigate to lib/services/api_base_helper.dart
            2.change baseUrl to the IP address of your wifi
            3.If you are running the app on emmulator the IP has to be set to http://10.0.2.2:8000
            4.To build APK : flutter build apk (*in terminal)
   )

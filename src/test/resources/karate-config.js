function fn() {

    var env = karate.env;

    if(!env){
       env = 'dev';
    }
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000


    var config = {}; //creating json object

//    config.baseUrl = 'https://devapi.suretyforce.com/apim'; //add this into config json object

    if(env == 'dev'){

        config.baseUrl = 'https://devapi.suretyforce.com/apim';

    }
    else if(env == 'qa'){
        config.baseUrl = 'http://pfa-auth-alb-qa-1606533570.us-east-2.elb.amazonaws.com/apim';
    }
    else{
        config.baseUrl= 'https://devapi.suretyforce.com/apim';
    }
    config.userName = 'rohith+pfaadmin@coreaiconsulting.com';
    config.password = 'test1234';
    config.deviceID = 'PFA-device-540';

    return config;
}
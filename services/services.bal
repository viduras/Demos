import ballerina/http;
import ballerina/log;

service subscription on new http:Listener(9092) {
    
    resource function get(http:Caller caller, http:Request req) returns error? {
        
        string? param = req.getQueryParamValue("id");
        string custNo = param is string ? param : "N/A";

        log:printInfo("Fetching information for customer " + custNo);
        
        json payload = {
            id: custNo,
            services: [
                {
                    'service: "voice",
                    status: "active"
                },
                {
                    'service: "4G data",
                    status: "active"
                },
                {
                    'service: "call fwd",
                    status: "inactive"
                },
                {
                    'service: "call wait",
                    status: "inactive"
                },
                {
                    'service: "sms",
                    status: "active"
                }
            ]
        };

        http:Response res = new;

        res.setJsonPayload(<@untainted>payload);

        var result = caller->respond(res);

        if (result is error) {
            log:printError("Error when responding",result);
        }
    }
}
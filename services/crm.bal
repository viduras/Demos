import ballerina/http;
import ballerina/log;

service customers on new http:Listener(9091) {
    
    resource function get(http:Caller caller, http:Request req) returns error? {

        string? param =  req.getQueryParamValue("id"); 
        string custNo = param is string ? param : "N/A";

        log:printInfo("Fetching information for customer " + custNo);

        json payload = {
            id: custNo,  
            name: "Jack Daniels", 
            address: "82 Robinsons Road, Deer Park VIC 3023",
            mobile: "0431615975"
        };

        http:Response res = new;

        res.setJsonPayload(<@untainted> payload);
        
        var result = caller->respond(res);

        if (result is error) {
            log:printError("Error when responding", result);
        }
    }
}
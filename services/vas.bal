import ballerina/http;
import ballerina/log;

service services on new http:Listener(9093) {
    
    resource function list(http:Caller caller, http:Request req) returns error? {

        log:printInfo("Received request");
        
        xml payload = xml `<vas>
                                <service>voice</service>
                                <service>sms</service>
                                <service>3G data</service>
                                <service>4G data</service>
                                <service>call waiting</service>
                                <service>call forwarding</service>
                                <service>call waiting</service>
                                <service>missed call alert</service>
                                <service>caller line indentification</service>
                                <service>voice mail</service>
                                <service>news service</service>
                            </vas>`;

        
        var result = caller->respond(payload);

        if (result is error) {
            log:printError("Error when responding", result);
        }
    }
}
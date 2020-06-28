import ballerina/http;
import ballerina/log;

service subscribers on new http:Listener(9090) {

    resource function list(http:Caller caller, http:Request req) returns error? {
        
        log:printInfo("Received request" );
        
        xml payload = xml `<subscribers>
                                <subscriber>
                                    <name>Donald Bradman</name>
                                    <mobile>0412521221</mobile>
                                </subscriber>
                                <subscriber>
                                    <name>Bill Ponsford</name>
                                    <mobile>048395624</mobile>
                                </subscriber>
                                <subscriber>
                                    <name>Dennis Lillee</name>
                                    <mobile>047259812</mobile>
                                </subscriber>
                                <subscriber>
                                    <name>Allan Border</name>
                                    <mobile>04433465497</mobile>
                                </subscriber>
                                <subscriber>
                                    <name>Steve Waugh</name>
                                    <mobile>048865676</mobile>
                                </subscriber>
                                <subscriber>
                                    <name>Ricky Ponting</name>
                                    <mobile>0423234365</mobile>
                                </subscriber>
                                <subscriber>
                                    <name>Michael Clarke</name>
                                    <mobile>0457687923</mobile>
                                </subscriber>
                            </subscribers>`;

        
        var result = caller->respond(payload);

        if (result is error) {
            log:printError("Error when responding", result);
        }
    }
}
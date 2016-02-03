/*
 * Created by Daniel Marell 14-03-02 12:02
 */
package se.caglabs.codenight;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class ApplicationController {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private Environment environment;

    @RequestMapping(value = "/echo", method = RequestMethod.GET)
    public String getEcho(@RequestParam(value = "message", required = false) String message) {
        logger.info("echo request: message: {}", message);
        if (message == null) {
            message = "";
        }
        String out = message;
        logger.info("echo response: " + out);
        return out;
    }

    @RequestMapping(value = "/version", method = RequestMethod.GET)
    public VersionResponse getVersion() {
        return new VersionResponse(BuildInfo.getVersion());
    }

    @RequestMapping(value = "/environment", method = RequestMethod.GET)
    public EnvironmentResponse getRunEnvironment() {
        return new EnvironmentResponse(RunEnvironment.getCurrentEnvironment(environment).toString());
    }

    @RequestMapping(value = "/hostname", method = RequestMethod.GET)
    public HostnameResponse getHostname() throws UnknownHostException {
        return new HostnameResponse(InetAddress.getLocalHost().getHostName());
    }









    @RequestMapping(value = "/echo2", method = RequestMethod.GET)
    public String getEcho(@RequestParam(value = "message", required = false) String message,
                          @RequestParam(value = "conversion", required = false) String conversion) {
        logger.info("echo request: message: {}, conversion={}", message, conversion);
        if (message == null) {
            message = "";
        }
        String out = convert(message, conversion);
        logger.info("echo response: " + out);
        return out;
    }

    private String convert(String message, String conversion) {
        if (conversion == null) {
            return message;
        }
        if (conversion.equalsIgnoreCase("uppercase")) {
            return message.toUpperCase();
        }
        return message;
    }
}
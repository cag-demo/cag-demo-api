/*
 * Created by Daniel Marell 14-03-02 12:02
 */
package se.caglabs.codenight;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SystemController {
    @Autowired
    private Environment environment;

    @RequestMapping(value = "/version", method = RequestMethod.GET)
    public VersionResponse getVersion() {
        return new VersionResponse(BuildInfo.getVersion());
    }

    @RequestMapping(value = "/environment", method = RequestMethod.GET)
    public EnvironmentResponse getRunEnvironment() {
        return new EnvironmentResponse(RunEnvironment.getCurrentEnvironment(environment).toString());
    }
}
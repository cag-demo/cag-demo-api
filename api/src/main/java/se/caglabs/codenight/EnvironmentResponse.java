/*
 * Created by Daniel Marell 24/10/15.
 */
package se.caglabs.codenight;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class EnvironmentResponse {
    @ApiModelProperty(value = "Name of runtime environment: local, test, stage, prod", required = true)
    private String environment;

    public EnvironmentResponse() {
    }

    public EnvironmentResponse(String environment) {
        this.environment = environment;
    }

    public String getEnvironment() {
        return environment;
    }
}

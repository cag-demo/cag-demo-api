/*
 * Created by Daniel Marell 24/10/15.
 */
package se.caglabs.codenight;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class VersionResponse {
	@ApiModelProperty(value = "Application version", required = true)
    private String version;

    public VersionResponse() {
    }

    public VersionResponse(String environment) {
        this.version = environment;
    }

    public String getVersion() {
        return version;
    }
}

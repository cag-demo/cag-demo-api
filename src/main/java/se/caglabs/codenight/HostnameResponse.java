/*
 * Created by Daniel Marell 24/10/15.
 */
package se.caglabs.codenight;

import com.fasterxml.jackson.annotation.JsonInclude;
import io.swagger.annotations.ApiModelProperty;

@JsonInclude(JsonInclude.Include.NON_NULL)
public class HostnameResponse {
	@ApiModelProperty(value = "Hostname", required = true)
    private String hostname;

    public HostnameResponse() {
    }

    public HostnameResponse(String environment) {
        this.hostname = environment;
    }

    public String getHostname() {
        return hostname;
    }
}

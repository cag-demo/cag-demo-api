/*
 * Created by Daniel Marell 02/02/16.
 */
package se.caglabs.codenight;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.boot.test.WebIntegrationTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.client.RestTemplate;

import static org.junit.Assert.assertEquals;

@Ignore // Keep for demo purposes
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = Application.class) // How to load and configure an ApplicationContext
@WebIntegrationTest // Full stack application test
public class SimplifiedVersionTest {
    @Test
    public void shouldGetVersion() throws Exception {
        RestTemplate template = new RestTemplate();
        ResponseEntity<VersionResponse> entity = template.getForEntity(
                "http://localhost:8080/version",
                VersionResponse.class);
        assertEquals(HttpStatus.OK, entity.getStatusCode());
        assertEquals(BuildInfo.getVersion(), entity.getBody().getVersion());
    }
}

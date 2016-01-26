/*
 * Created by Daniel Marell 25/01/16.
 */
package se.caglabs.codenight;

import java.util.Scanner;

public final class BuildInfo {
    private BuildInfo() {
    }

    public static String getVersion() {
        return new Scanner(BuildInfo.class.getResourceAsStream("/version.txt"), "UTF-8").useDelimiter("\\A").next();
    }
}

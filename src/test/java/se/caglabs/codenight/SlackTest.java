/*
 * Created by Daniel Marell 08/02/16.
 */
package se.caglabs.codenight;

import com.ullink.slack.simpleslackapi.SlackChannel;
import com.ullink.slack.simpleslackapi.SlackSession;
import com.ullink.slack.simpleslackapi.events.SlackMessagePosted;
import com.ullink.slack.simpleslackapi.impl.SlackSessionFactory;
import com.ullink.slack.simpleslackapi.listeners.SlackMessagePostedListener;

public class SlackTest {
    public static void main(String[] args) throws Exception {
        SlackSession session = SlackSessionFactory.createWebSocketSlackSession("xoxb-20593976996-iaPHE7Zgkyp58bxew2AJxJHs");
        session.connect();
        final SlackChannel channel = session.findChannelByName("general");
        session.sendMessage(channel, "Hej, jag heter Eve!", null);



        final String me = session.sessionPersona().getUserName();
        session.addMessagePostedListener(new SlackMessagePostedListener() {
            @Override
            public void onEvent(SlackMessagePosted event, SlackSession session) {
                if (!event.getSender().getUserName().equals(me)) {
                    session.sendMessage(
                            channel,
                            String.format("Du skrev %d tecken", event.getMessageContent().length()),
                            null);
                }
            }
        });
    }
}

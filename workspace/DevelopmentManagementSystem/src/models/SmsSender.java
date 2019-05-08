package models;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class SmsSender {
    // Find your Account Sid and Auth Token at twilio.com/console
    public static final String ACCOUNT_SID =
            "ACdfe8be76ab30a6eb18df56aeffe3019e";
    public static final String AUTH_TOKEN =
            "bb8a11f81e7005f4b94b7c07ca02b943";
    
    public static void sendMessage(String toNumber, String textMessage) {
    	
    	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

        Message message = Message
                .creator(new PhoneNumber(toNumber), // to
                        new PhoneNumber("+16573014971"), // from
                        textMessage)
                .create();

//        System.out.println(message.getSid());

    }
}
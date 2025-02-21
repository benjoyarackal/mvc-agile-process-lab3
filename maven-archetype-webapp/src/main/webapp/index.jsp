import java.time.LocalTime;

public class HomeController {
    public String getGreeting() {
        LocalTime now = LocalTime.now();
        String greeting = now.isBefore(LocalTime.NOON) ? "Good morning, Ben" : "Good afternoon, Ben";
        System.out.println(greeting + ", Welcome to COMP367");
        return greeting + ", Welcome to COMP367";
    }
}

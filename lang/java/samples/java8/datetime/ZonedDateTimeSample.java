import java.time.ZonedDateTime;
import java.time.temporal.TemporalAdjusters;

public class ZonedDateTimeSample {
    public static void main(String[] args) {
        ZonedDateTime now = ZonedDateTime.now();
        System.out.println("now = " + now.toString());

        ZonedDateTime t1 = now.withMinute(0).withSecond(0).withNano(0);
        System.out.println("t1 = " + t1.toString());

        ZonedDateTime t2 = now.with(TemporalAdjusters.lastDayOfMonth());
        System.out.println("t2 = " + t2.toString());

        ZonedDateTime t3 = now.plusYears(1).minusHours(2);
        System.out.println("t3 = " + t3.toString());
    }
}

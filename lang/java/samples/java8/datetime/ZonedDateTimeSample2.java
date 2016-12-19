import java.time.ZonedDateTime;
import java.time.ZoneId;

public class ZonedDateTimeSample2 {
    public static void main(String[] args) {
        ZonedDateTime t = ZonedDateTime.of(2015, 5, 24, 23, 13, 52, 0, ZoneId.of("Asia/Tokyo"));
        System.out.println(t.getYear());
        System.out.println(t.getMonth());
        System.out.println(t.getMonthValue()); // not start from "0"
        System.out.println(t.getDayOfYear());
        System.out.println(t.getDayOfMonth());
        System.out.println(t.getDayOfWeek());
        System.out.println(t.getHour());
        System.out.println(t.getMinute());
        System.out.println(t.getSecond());
        System.out.println(t.getNano());
        System.out.println(t.getZone().getId());
    }
}

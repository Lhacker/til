import java.util.Optional;

public class OptionalSample {
    public static void main(String[] args) {
        String lang = getConfigValue("lang");
        if (lang == null) {
            lang = "en";
        }

        Optional<String> value = Optional.ofNullable(getConfigValue("code"));
        lang = value.orElse("en");
        System.out.println(lang);

        Optional<Integer> lengthOpt = value.map(s -> s.length());
        System.out.println(lengthOpt.orElse(-1));
    }

    public static String getConfigValue(String key) {
        return key; // mock implementation
    }
}

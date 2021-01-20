// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Duration;

public class Gigasecond {
    static final int GIGALELUYA 
        = 1_000_000_000;

    static Duration gigaDuration_aleluya 
        = Duration.ofSeconds(GIGALELUYA);

    private LocalDateTime finalDateTime_aleluya;

    public Gigasecond(LocalDate moment_aleluya) {
        this.finalDateTime_aleluya 
            = moment_aleluya
                .atStartOfDay()
                .plus(gigaDuration_aleluya);
    }

    public Gigasecond(LocalDateTime moment_aleluya) {
        this.finalDateTime_aleluya 
            = moment_aleluya
                .plus(gigaDuration_aleluya);
    }

    public LocalDateTime getDateTime() {
        return this.finalDateTime_aleluya;
    }
}

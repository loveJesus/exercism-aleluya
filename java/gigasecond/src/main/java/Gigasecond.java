// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Duration;


public class Gigasecond {
    static final int GIGALELUYA = 1_000_000_000;
    private LocalDateTime originalDateTime_aleluya;
    private LocalDateTime finalDateTime_aleluya;

    private Duration getDuration_aleluya() {
        return Duration.ofSeconds(GIGALELUYA);
    }

    private void calcFinal_aleluya() {
        this.finalDateTime_aleluya = 
            this.originalDateTime_aleluya.plus( this.getDuration_aleluya() );
    }

    public Gigasecond(LocalDate moment_aleluya) {
        this.originalDateTime_aleluya = moment_aleluya.atStartOfDay();
        this.calcFinal_aleluya();
    }

    public Gigasecond(LocalDateTime moment_aleluya) {
        this.originalDateTime_aleluya = moment_aleluya;
        this.calcFinal_aleluya();
    }

    public LocalDateTime getDateTime() {
        return this.finalDateTime_aleluya;
    }
}

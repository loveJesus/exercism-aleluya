// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Duration;


public class Gigasecond {
    static final int GIGALELUYA = 1_000_000_000;
    static Duration gigaDuration_aleluya = null;

    private LocalDateTime originalDateTime_aleluya;
    private LocalDateTime finalDateTime_aleluya;

    public Gigasecond(LocalDate moment_aleluya) {
        this.originalDateTime_aleluya = moment_aleluya.atStartOfDay();
    }

    public Gigasecond(LocalDateTime moment_aleluya) {
        this.originalDateTime_aleluya = moment_aleluya;
    }

    private Duration getDuration_aleluya() {
        //memoize the static variable, should only happen once per running the app
        if (gigaDuration_aleluya == null) 
            gigaDuration_aleluya = Duration.ofSeconds(GIGALELUYA);

        return gigaDuration_aleluya;
    }

    private void calcFinal_aleluya() {
        //memoize the final time for use before display
        if (this.finalDateTime_aleluya == null)
            this.finalDateTime_aleluya = 
                this.originalDateTime_aleluya
                    .plus( this.getDuration_aleluya() );
    }

    public LocalDateTime getDateTime() {
        this.calcFinal_aleluya();
        return this.finalDateTime_aleluya;
    }
}

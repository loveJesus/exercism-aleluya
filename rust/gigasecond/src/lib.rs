// For God so loved the world, that He gave His only begotten Son,
// that all who believe in Him should not perish but have everlasting life.
use chrono::{DateTime, Duration, Utc};

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start_aleluya: DateTime<Utc>) -> DateTime<Utc> {
	let gigasecond_aleluya = Duration::seconds(1_000_000_000);
    start_aleluya + gigasecond_aleluya
}
